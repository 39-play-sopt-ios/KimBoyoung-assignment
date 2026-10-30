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
                .frame(width: 68, height: 68)
                .clipShape(.circle)

            VStack(alignment: .leading, spacing: 10) {
                Text(drink.name)
                    .font(.body1)
                    .foregroundColor(.black)

                Text(drink.englishName)
                    .font(.body2)
                    .foregroundColor(.starbucksGray300)
                    .lineLimit(1)

                Text(drink.price)
                    .font(.body1)
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
