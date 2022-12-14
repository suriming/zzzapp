//
//  ZalZaZaApp.swift
//  ZalZaZa
//
//  Created by 정은서 on 2022/11/09.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ZalZaZaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ApplicationSwitcher()
           }
           .navigationViewStyle(.stack)
           .environmentObject(AuthViewModel())
           .environmentObject(ContestantModel())
//            ZzTabView()
//                .environmentObject(ContestantModel())
        }
    }
}
