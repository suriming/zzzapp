//
//  SignUpView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/12/03.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name = ""
    @State var birthday = Date()
    @State var email = ""
    @State var pw = ""
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("SubPrimaryColor")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("We're almost there.\nJust a few more to go.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.title)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    Text("Username")
                        .foregroundColor(.white)
                        .font(.system(size:20))
                        .padding(.leading)
                    TextField("Username", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                HStack {
                    
                    DatePicker(
                        "Birthday ",
                        selection: $birthday,
                        displayedComponents: [.date]
                    )
                    .font(.system(size:20))
                    .colorScheme(.dark)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(.white)
                        .font(.system(size:20))
                        .padding(.leading)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .foregroundColor(.white)
                        .font(.system(size:20))
                        .padding(.leading)
                    SecureField("Password", text: $pw)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                Button {
                    viewModel.registerUser(name: name, birthday: birthday, email: email, password: pw)
                    name = ""
                    birthday = Date()
                    email = ""
                    pw = ""
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(50)
                        Text("Sign up")
                            .foregroundColor(.white)
                            .font(.system(size:20))
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
