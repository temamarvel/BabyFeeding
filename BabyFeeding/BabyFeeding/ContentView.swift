//
//  ContentView.swift
//  BabyFeeding
//
//  Created by Art Denisov on 03.12.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var records: [Record]
    @State private var showAddSheet = false
    @State private var productName = ""
    @State private var productCompany = ""
    @State private var isGoodReaction = true
    var body: some View {
        VStack(alignment: .leading){
            Text("Products").font(.title).padding()
            
            List(records){ record in
                HStack{
                    VStack(alignment: .leading){
                        Text(record.productName)
                        Text(record.productCompany)
                    }
                    Spacer()
                    VStack{
                        Image(systemName: record.isGoodReaction ? "hand.thumbsup.circle" : "hand.thumbsdown.circle").foregroundColor(record.isGoodReaction ? .green : .red)
                        Text(record.isGoodReaction ? "good" : "bad")
                    }
                }
                .swipeActions(){
                    Button("Delete", role: .destructive){
                        modelContext.delete(record)
                    }
                }
            }
            .sheet(isPresented: $showAddSheet){
                VStack{
                    TextField("Enter product name", text: $productName)
                    TextField("Enter product company", text: $productCompany)
                    Toggle(isOn: $isGoodReaction){
                        Text("Is reaction good?")
                    }.toggleStyle(.switch)
                    Button("Add"){
                        let record = Record(productName: productName, productCompany: productCompany, isGoodReaction: isGoodReaction)
                        modelContext.insert(record)
                        
                        showAddSheet.toggle()
                        
                        productName = ""
                        productCompany = ""
                        isGoodReaction = true
                    }
                }
            }
            .overlay(alignment: .bottom){
                Button("Add"){ showAddSheet.toggle() }.buttonStyle(.borderedProminent)
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
