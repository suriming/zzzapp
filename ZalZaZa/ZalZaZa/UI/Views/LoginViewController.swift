//
//  LoginViewController.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/30.
//

import Foundation
import SwiftUI
import FirebaseAuth

// NOT THIS FILE
class LoginViewController: UIViewController {
 
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    /* Login Button Action */
    @IBAction func userLoginAction(_ sender: Any) {
        
        let email: String = emailTextField.text!.description
        let pw: String = pwTextField.text!.description
        
        // Firebase Auth Login
        Auth.auth().signIn(withEmail: email, password: pw) {authResult, error in
            if authResult != nil {
                print("Login successful")
            } else {
                print("Failed to login")
                print(error.debugDescription)
            }
            
        }
    }
    
}

//struct LoginViewController_Previews: PreviewProvider {
//
//    static var previews: some View {
//        NavigationLink(destination:
//    }
//}
//
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//        let viewController: UIViewController
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//    }
//
//    func toPreview() -> some View {
//        Preview(viewController: self)
//    }
//}

