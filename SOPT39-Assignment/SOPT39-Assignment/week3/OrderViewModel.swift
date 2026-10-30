//
//  OrderViewModel.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import Foundation
import Observation

@Observable
final class OrderViewModel {
    private(set) var allMenus: [AllMenuModel] = [
        AllMenuModel(name: "NEW", imageName: "image_8"),
        AllMenuModel(name: "추천", imageName: "image_6"),
        AllMenuModel(name: "콜드 브루", imageName: "image_7"),
        AllMenuModel(name: "블론드", imageName: "image_5"),
        AllMenuModel(name: "에스프레소", imageName: "image_4")
    ]

    private(set) var newDrinks = DrinkModel.newDrinks

    var selectedTab: StarbucksTab = .order
    var selectedMenuType: OrderMenuType = .beverage
    var selectedStore = "성수역"
    var cartCount = 0
}
