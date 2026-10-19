//
//  StarbucksLoginView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/16/26.
//

import SwiftUI

struct StarbucksLoginView: View {
    @State private var email = ""
    
    private var isEmailValid: Bool {
        email.wholeMatch(of: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/) != nil
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            //안내문구
            Group {
                Text("로그인/가입하려는 \n이메일을 입력해주세요")
                    .font(.custom("Pretendard-SemiBold", size: 23)
                    )
                    .padding(.top, 109)
                    .padding(.bottom, 13)
                
                Text("결제 등 중요 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요")
                    .lineSpacing(5)
                    .font(.custom("Pretendard-Light", size: 14))
                    .foregroundColor(Color(red: 0.75, green: 0.75, blue: 0.75))
            }
            .padding(.leading, 30)
            
            
            VStack(alignment: .center, spacing: 0){
                //입력창
                HStack(alignment: .center, spacing: 0) {
                    TextField("email@address.com", text: $email)
                        .font(.custom("Pretendard-Regular", size: 12))
                                
                    if !email.isEmpty {
                        Button {
                            email = ""
                        } label: {
                            Image("Close Square")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        .padding(.trailing, 4)
                        
                        Image(isEmailValid ? "check-on" : "check-off")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    

                }
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity)
                .frame(height: 47)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 31)
                .padding(.top, 27)

                
                Spacer()
                
                //네비게이션 버튼
                NavigationLink {
                    StarbucksPasswordView(email: email)
                } label: {
                    HStack(alignment: .center, spacing: 0) {
                        Text("다음")
                            .font(.custom("Pretendard", size: 18)
                                    .weight(.medium)
                            )
                            .foregroundColor(isEmailValid ? .white : Color( .starbucksGray300))
                    }
                    .padding(.horizontal, 0)
                    .padding(.top, 17)
                    .padding(.bottom, 18)
                    .frame(width: 331, height: 56, alignment: .center)
                    .background(isEmailValid ? Color(.starbucksGreen) : Color(.starbucksGray200))
                    .cornerRadius(10)
                }
                .disabled(!isEmailValid)
                .buttonStyle(.plain)
                
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,
               alignment: .topLeading)
        .background(Color(.starbucksBgWhite).ignoresSafeArea())
            
    }
    
}

#Preview {
    NavigationStack {
        StarbucksLoginView()
        }
}
