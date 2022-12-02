//
//  AuthView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/12/02.
//

import SwiftUI

struct AuthView: View {
    
    @State var email = ""
    @State var pw = ""
    @State var isLoading: Bool = true
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("SubPrimaryColor")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Welcome")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    Text("Login in to your account.")
                        .foregroundColor(.white)
                        .font(.system(size:20))
                }
                
                if viewModel.currentUser == nil {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Email")
                                .foregroundColor(.white)
                                .font(.system(size:20))
                                .padding(.leading)
                            TextField("Email", text: $email)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Password")
                                .foregroundColor(.white)
                                .font(.system(size:20))
                                .padding(.leading)
                            SecureField("Password", text: $pw)
                                .textFieldStyle(.roundedBorder)
                                .padding(.horizontal)
                        }
                        
                        VStack {
                            Button {
                                viewModel.login(email: email, password: pw)
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 300, height: 50)
                                        .background(Color.blue)
                                        .cornerRadius(50)
                                    Text("Log in")
                                        .foregroundColor(.white)
                                        .font(.system(size:20))
                                }
                            }
                            .padding(.vertical)
                            
                            HStack {
                                Text("Don't have one yet?")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                NavigationLink(destination: SignUpView(),
                                    label: {
                                        Text("Sign up")
                                            .foregroundColor(.white)
                                            .font(.system(size:20))
                                })
                                
                            }
                            
                        }
                    }
                    
                } else {
                    ZzTabView()
                        .environmentObject(ContestantModel())
                }
            }
            
            if isLoading {
                LaunchScreenView().transition(.opacity).zIndex(1)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                withAnimation { if isLoading {isLoading.toggle()} }
            })
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
