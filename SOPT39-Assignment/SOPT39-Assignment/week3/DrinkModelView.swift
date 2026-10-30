//
//  DrinkModelView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import SwiftUI

struct DrinkModelView: View {
    let drink: DrinkModel

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(drink.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(.circle)

            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(drink.name)
                        .font(.orderMenu)
                        .foregroundColor(.black)

                    Text(drink.englishName)
                        .font(.cap2)
                        .foregroundColor(.starbucksGray300)
                }

                Text(drink.price)
                    .font(.orderMenu)
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 21)
        .padding(.vertical, 14)
    }
}

#Preview {
    DrinkModelView(drink: DrinkModel.newDrinks[1])
}
