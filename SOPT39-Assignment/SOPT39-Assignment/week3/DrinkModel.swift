//
//  DrinkModel.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import Foundation

struct DrinkModel: Identifiable {
    let id: UUID
    let name: String
    let englishName: String
    let price: String
    let imageName: String
    let description: String
    var isFavorite: Bool

    init(
        id: UUID = UUID(),
        name: String,
        englishName: String,
        price: String,
        imageName: String,
        description: String,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.englishName = englishName
        self.price = price
        self.imageName = imageName
        self.description = description
        self.isFavorite = isFavorite
    }
}
