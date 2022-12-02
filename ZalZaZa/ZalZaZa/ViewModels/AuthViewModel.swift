//
//  AuthViewModel.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/12/02.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

class AuthViewModel: ObservableObject {
    
    @Published var currentUser: Firebase.User?
    
    init() {
//        currentUser = Auth.auth().currentUser
        currentUser = nil
    }
    
    func createUserUID(uid:String, name:String, birthdate:Date, email:String) {
        let db = Firestore.firestore()
        
        db.collection("contestants").document(uid)
            .setData(["name":name, "birthdate":birthdate, "email":email, "lastSleepTimeHour":6, "lastSleepTimeMinute":30], merge: true) { err in
                if let err = err {
                    print("Error creating User UID: \(err)")
                }
            }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            
            self.currentUser = result?.user
        }
    }
    
    func logout() {
        currentUser = nil
        try? Auth.auth().signOut()
    }
    
    func registerUser(name:String, birthday:Date, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.createUserUID(uid: user.uid, name: name, birthdate: birthday, email:user.email!)
            
            print(user.uid)
        }
    }
}
