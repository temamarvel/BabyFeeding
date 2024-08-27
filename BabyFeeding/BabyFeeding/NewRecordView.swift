//
//  NewRecordView.swift
//  BabyFeeding
//
//  Created by Art Denisov on 04.12.2023.
//

import SwiftUI
import SwiftData

struct NewRecordView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var records: [Record]
    @State private var text = ""
    
    var body: some View {
        TextField("Enter product name", text: $text).onSubmit() {
            let record = Record(productName: text, productCompany: "TestCompany", isGoodReaction: true)
            modelContext.insert(record)
        }
        
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) { num in
                    Button(action: { text = "Qwert \(num)"}){
                        Text("Test \(num)").font(.footnote)
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
                    .tint(.red)
                }
            }.fixedSize()
        }.scrollIndicators(.hidden)
        
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(records) { record in
                    Button(action: { text = "Qwert \(record.productName)"}){
                        Text("Test \(record.productName)").font(.system(size: 20))
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)
                    .tint(.green)
                }
            }.fixedSize()
        }.scrollIndicators(.hidden)
    }
    
}

#Preview {
    NewRecordView()
}
