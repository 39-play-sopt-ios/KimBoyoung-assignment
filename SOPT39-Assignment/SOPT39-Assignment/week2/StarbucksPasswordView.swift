//
//  StarbucksPasswordView.swift
//  SOPT39-Assignment
//
//  Created by BY on 10/16/26.
//

import SwiftUI

struct StarbucksPasswordView: View {
    let email: String
    
    @State private var password = ""
    @State private var nickname = ""
    @State private var isPasswordVisible = false
    @State private var isNicknameSheetPresented = false
    
    //정규식씨
    private var isPasswordValid: Bool {
        password.wholeMatch(of: /(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{10,}/) != nil
    }

    private var isSignUpEnabled: Bool {
        isPasswordValid &&
        !nickname.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        //좌측 정렬
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                
                //안내문구
                Group {
                    Text("사용할 비밀번호를\n입력해주세요")
                        .font(.custom("Pretendard-SemiBold", size: 23)
                        )
                        .padding(.top, 109)
                        .padding(.bottom, 13)
                    
                    Text("\(email)로 가입중")
                        .font(
                            Font.custom("Pretendard", size: 12)
                                .weight(.medium)
                        )
                        .foregroundColor(.starbucksGray300)
                }
                .padding(.leading, 30)
                
                
                //가운데 정렬
                VStack(alignment: .center, spacing: 0){
                    //입력창
                    HStack(alignment: .center, spacing: 0) {
                        if isPasswordVisible {
                            TextField("비밀번호 입력", text: $password)
                                .font(.custom("Pretendard-Regular", size: 12))
                        } else {
                            SecureField(
                                "",
                                text: $password,
                                prompt: Text("비밀번호 입력")
                                    .font(.custom("Pretendard-Regular", size: 12))
                            )
                            .font(.system(size: 18, weight: .semibold))//일단 킵
                        }
                        
                        if !password.isEmpty {
                            Button {
                                password = ""
                            } label: {
                                Image("Close Square")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.trailing, 4)
                            
                            Button {
                                isPasswordVisible.toggle()
                            } label: {
                                Image(isPasswordVisible ? "eye" : "eye-slash")
                            }
                        }
                        
                        
                        
                    }
                    .padding(.horizontal, 15)
                    .frame(maxWidth: .infinity)
                    .frame(height: 47)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 31)
                    .padding(.top, 27)
                    
                    // 정규식 확인
                    HStack(alignment: .center, spacing: 5) {
                        Image(isPasswordValid ? "enable-on" : "enable-off")
                            .resizable()
                            .frame(width: 13, height: 13)
                        
                        Text("영문, 숫자, 특수문자 포함 10글자 이상")
                            .font(.custom("Pretendard-Regular", size: 12))
                            .foregroundColor(
                                isPasswordValid
                                ? Color(.starbucksGreen)
                                : Color(.starbucksGray300)
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .padding(.top, 13)

                    Button {
                        isNicknameSheetPresented = true
                    } label: {
                        Text(nickname.isEmpty ? "닉네임 설정" : nickname)
                            .font(.custom("Pretendard-Regular", size: 12))
                            .foregroundColor(
                                nickname.isEmpty
                                ? Color(.starbucksGray300): Color(.starbucksGray100)
                            )
                    }
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 40)
                    
                    
                    Spacer()
                    
                    //네비게이션 버튼
                    NavigationLink {
                        StarbucksWelcomeView(nickname: nickname)
                    } label: {
                        HStack(alignment: .center, spacing: 0) {
                            Text("가입하기")
                                .font(.custom("Pretendard", size: 18)
                                    .weight(.medium)
                                )
                                .foregroundColor(isSignUpEnabled ? .white : Color( .starbucksGray300))
                        }
                        .padding(.horizontal, 22)
                        .frame(width: 331, height: 56, alignment: .center)
                        .background(isSignUpEnabled ? Color(.starbucksGreen) : Color(.starbucksGray200))
                        .cornerRadius(10)
                    }
                    .disabled(!isSignUpEnabled)
                    .buttonStyle(.plain)
                    .padding(.bottom, 47)
                    
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,
                   alignment: .topLeading)
            .background(Color(.starbucksBgWhite).ignoresSafeArea())
        }
        .overlay(alignment: .bottom) {
            if isNicknameSheetPresented {
                VStack(alignment: .leading, spacing: 0) {
                    Capsule()
                        .fill(.white.opacity(0.08))
                        .frame(width: 35, height: 5)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 5)

                    Text("닉네임을 입력해주세요")
                        .font(.custom("Pretendard-SemiBold", size: 18))
                        .foregroundColor(.white)
                        .padding(.leading, 22)
                        .padding(.top, 32)

                    TextField("닉네임 입력", text: $nickname)
                        .font(.custom("Pretendard-Regular", size: 12))
                        .foregroundColor(.black)
                        .padding(.horizontal, 15)
                        .frame(height: 47)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 29)
                        .padding(.top, 19)

                    Spacer()
                    
                    //완료 버튼
                    Button {
                        isNicknameSheetPresented = false
                    } label: {
                        Text("완료")
                            .font(.custom("Pretendard-Medium", size: 18))
                            .foregroundColor(.starbucksGreen)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 47)
                    .disabled(
                        nickname.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    )
                }
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .background(Color(.starbucksDarkgreen))
                .clipShape(
                    .rect(
                        topLeadingRadius: 12,
                        topTrailingRadius: 12
                    )
                )
                .ignoresSafeArea(edges: .bottom)
                .transition(.move(edge: .bottom))
                .gesture(
                    DragGesture().onEnded { value in
                        if value.translation.height > 50 {
                            isNicknameSheetPresented = false
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    StarbucksPasswordView(email: "test@email.com")
}
