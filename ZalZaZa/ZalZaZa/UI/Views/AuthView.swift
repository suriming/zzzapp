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
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        ZStack {
            if viewModel.currentUser == nil {
                VStack {
                    TextField("Email", text: $email)
                    SecureField("PW", text: $pw)
                    
                    HStack {
                        Button {
                            viewModel.registerUser(email: email, password: pw)
                        } label: {
                            Text("Register")
                        }
                        
                        Button {
                            viewModel.login(email: email, password: pw)
                        } label: {
                            Text("Log in")
                        }
                        
                        Button {
                            viewModel.logout()
                        } label: {
                            Text("Log out")
                        }
                    }
                }
                
                //            Text(viewModel.currentUser?.uid ?? "Not logged in")
                //                .padding()
                
            } else {
                ZzTabView()
                    .environmentObject(ContestantModel())
            }
        }
        .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
