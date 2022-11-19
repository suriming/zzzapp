//
//  LoginView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/19.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    var body: some View {
        SignInWithAppleButtonView()
                .frame(width: 280, height: 60, alignment: .center)
                .onTapGesture { self.showAppleLogin() }
    }
    
    private func showAppleLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.email, .fullName]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
    }
}

struct SignInWithAppleButtonView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
