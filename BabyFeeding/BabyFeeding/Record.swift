//
//  Record.swift
//  BabyFeeding
//
//  Created by Art Denisov on 03.12.2023.
//

import Foundation
import SwiftData

@Model
final class Record {
    let id: UUID
    let productName: String
    let productCompany: String
    //TODO: make it with enum
    let isGoodReaction: Bool
    
    init(productName: String, productCompany: String, isGoodReaction: Bool) {
        self.id = UUID()
        self.productName = productName
        self.productCompany = productCompany
        self.isGoodReaction = isGoodReaction
    }
}
