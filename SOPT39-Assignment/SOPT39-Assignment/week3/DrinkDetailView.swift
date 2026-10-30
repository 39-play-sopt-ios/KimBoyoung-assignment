//
//  DrinkDetailView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import SwiftUI

struct DrinkDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isFavorite = false

    let drink: DrinkModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .top) {
                        Image(drink.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        HStack(alignment: .center, spacing: 0) {
                            Button {
                                dismiss()
                            } label: {
                                Image(.back2)
                                    .resizable()
                                    .frame(width: 39, height: 39)
                            }
                            .buttonStyle(.plain)
                            
                            Spacer()
                            
                            Button {
                            } label: {
                                Image(.share)
                                    .resizable()
                                    .frame(width: 34, height: 35)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal, 21)
                        .padding(.top, 53)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 333)
                    .clipped()
                    .padding(.top, 20)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .center, spacing: 9) {
                            Text(drink.name)
                                .font(.head2)
                                .foregroundColor(.starbucksGrayBack)
                            
                            Text("NEW")
                                .font(.orderTab)
                                .foregroundColor(.starbucksLightgreen)
                        }
                        
                        Text(drink.englishName)
                            .font(.body2)
                            .foregroundColor(.starbucksGray300)
                            .padding(.top, 2)
                        
                        Text(drink.description)
                            .font(.pretendard(.regular, size: 14))
                            .foregroundColor(.starbucksGray700)
                            .frame(width: 340, alignment: .leading)
                            .padding(.top, 14)
                        
                        Text(drink.price)
                            .font(.head2)
                            .foregroundColor(.black)
                            .padding(.top, 21)
                    }
                    .padding(.horizontal, 21)
                    .padding(.top, 21)
                    
                    Text("ICED ONLY")
                        .font(.pretendard(.semiBold, size: 14))
                        .foregroundColor(.starbucksBlue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .overlay {
                            Capsule()
                                .stroke(.starbucksGray200, lineWidth: 1)
                        }
                        .padding(.horizontal, 25)
                        .padding(.top, 28)
                    
                    Text("*컬러 드리즐은 시간이 지날수록 번지는 현상이 있으나\n음료 품질과는 무관하니 안심하고 드세요.")
                        .font(.pretendard(.regular, size: 14))
                        .foregroundColor(.starbucksGray600)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 21)
                        .background(.starbucksGray500)
                        .padding(.horizontal, 21)
                        .padding(.top, 14)
                }
            }
            
            HStack(alignment: .center, spacing: 20) {
                Button {
                    isFavorite = !isFavorite
                } label: {
                    Image(isFavorite ? "favorite_added 1" : "favorite_N_added")
                        .resizable()
                        .frame(width: 26, height: 26)
                }
                .buttonStyle(.plain)

                Button {
                } label: {
                    Text("주문하기")
                        .font(.orderMenu)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(.starbucksGreen)
                        .clipShape(.capsule)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 21)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.white)
            .shadow(
                color: .black.opacity(0.1),
                radius: 6.5
            )
        }
        .background(.white)
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        DrinkDetailView(drink: DrinkModel.newDrinks[0])
    }
}
