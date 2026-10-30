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

extension DrinkModel {
    static let newDrinks: [DrinkModel] = [
        DrinkModel(
            name: "아이스 카스텔라 고구마 라떼",
            englishName: "Iced Castella Sweet Potato Milk",
            price: "6,900원",
            imageName: "image_3",
            description: """
            가을에 잘 어울리는 군고구마를 한 잔에 담은 음료.
            포슬한 카스텔라, 쫀득한 펄이 어우러져 다채로운 식감을 즐길 수 있는 음료.
            """
        ),
        DrinkModel(
            name: "아이스 말차 글레이즈드 티 라떼",
            englishName: "Iced Malcha Glazed Tea Latte",
            price: "6,700원",
            imageName: "image_1",
            description: "쌉싸름한 말차와 부드러운 글레이즈드 폼이 어우러진 달콤한 티 라떼."
        ),
        DrinkModel(
            name: "스타벅스 자몽 허니 에어로카노",
            englishName: "Starbucks GrapeFruit Honey Aerocano",
            price: "6,100원",
            imageName: "image_2",
            description: "상큼한 자몽과 달콤한 꿀, 부드러운 커피 거품을 함께 즐기는 음료."
        )
    ]
}
