//
//  StarbucksWelcomeView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/16/26.
//

import SwiftUI

struct StarbucksWelcomeView: View {
    let nickname: String
    var onMainButtonTap: () -> Void = { }

    var body: some View {
        VStack(spacing: 0) {
            Image("starbucks_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 261.16, height: 200.52)
                .padding(.top, 112)

            Text("\(nickname)님\n가입을 환영합니다!")
                .font(.custom("Pretendard-SemiBold", size: 23))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 93.48)

            Spacer()

            Button(action: onMainButtonTap) {
                Text("메인으로")
                    .font(.custom("Pretendard-Medium", size: 18))
                    .foregroundColor(.starbucksGreen)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 22)
            .padding(.bottom, 47)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.starbucksDarkgreen))
        .ignoresSafeArea()
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        StarbucksWelcomeView(nickname: "보영")
    }
}
