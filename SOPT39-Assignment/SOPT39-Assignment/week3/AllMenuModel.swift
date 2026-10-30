//
//  AllMenuModel.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import Foundation

struct AllMenuModel: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

enum OrderMenuType: String, Identifiable {
    case beverage = "음료"
    case food = "푸드"
    case product = "상품"

    var id: Self { self }
}

enum StarbucksTab: Hashable {
    case home
    case pay
    case order
    case gift
    case other
}
