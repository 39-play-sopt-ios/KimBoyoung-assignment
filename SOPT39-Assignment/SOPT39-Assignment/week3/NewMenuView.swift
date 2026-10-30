//
//  NewMenuView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/30/26.
//

import SwiftUI

struct NewMenuView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel = OrderViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image(.back)
                        .resizable()
                        .frame(width: 21, height: 21)
                }
                .buttonStyle(.plain)

                Spacer()

                Button {
                } label: {
                    Image(.searchIcon)
                        .resizable()
                        .frame(width: 21, height: 21)
                }
                .buttonStyle(.plain)
            }
            .frame(height: 49)
            .padding(.horizontal, 21)

            HStack(alignment: .center, spacing: 0) {
                Text("NEW")
                    .font(.orderTitle)
                    .foregroundColor(.black)

                Spacer()
            }
            .frame(height: 46)
            .padding(.horizontal, 18)

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.newDrinks) { drink in
                        NavigationLink {
                            Text(drink.name)
                        } label: {
                            DrinkModelView(drink: drink)
                        }
                    }
                }
            }

            OrderStoreBar()
        }
        .background(.white)
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct OrderStoreBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Button {
            } label: {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center, spacing: 0) {
                        Text("성수역")
                            .font(.orderTab)
                            .foregroundColor(.white)

                        Spacer()

                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                    .frame(height: 29)

                    Rectangle()
                        .fill(.starbucksGrayStore)
                        .frame(height: 1)
                }
                .frame(width: 239)
            }

            Spacer()

            Button {
            } label: {
                ZStack(alignment: .center) {
                    Image(systemName: "bag")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 33, height: 37)

                    Text("0")
                        .font(.orderTab)
                        .foregroundColor(.white)
                        .padding(.top, 9)
                }
                .frame(width: 42, height: 42)
            }
        }
        .padding(.horizontal, 14)
        .frame(height: 60)
        .background(.starbucksGrayBack)
    }
}

#Preview {
    NavigationStack {
        NewMenuView()
    }
}
