//
//  NewRecordView.swift
//  BabyFeeding
//
//  Created by Art Denisov on 04.12.2023.
//

import SwiftUI

struct NewRecordView: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Enter product name", text: $text)
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) { num in
                    Button("Column \(num)"){text = "Prop \(num)"}
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        .tint(.red)
                }
            }.fixedSize()
        }
    }
}

#Preview {
    NewRecordView()
}
