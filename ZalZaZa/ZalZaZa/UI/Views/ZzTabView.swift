//
//  TabView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/13.
//

import SwiftUI

struct ZzTabView: View {
    
    @State var tabIndex = 0
    @State var isLoading: Bool = true
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $tabIndex) {
                
                ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, .none)
                    }
                }
                .tag(0)
                
                ZStack {
                    Color("MainViewColor")
                        .ignoresSafeArea()
                    
                    Text("tab 2")
                        .foregroundColor(Color.white)
                    
                }
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar.doc.horizontal")
                    }
                }
                .tag(1)
                
                ZStack {
                    Color("MainViewColor")
                        .ignoresSafeArea()
                    
                    Text("tab 3")
                        .foregroundColor(Color.white)
                    
                }
                .tabItem {
                    VStack {
                        Image(systemName: "moon")
                            .environment(\.symbolVariants, .none)
                    }
                }
                .tag(2)
                
                ZStack {
                    Color("MainViewColor")
                        .ignoresSafeArea()
                    
                    Text("tab 4")
                        .foregroundColor(Color.white)
                    
                }
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                    }
                }
                .tag(3)
                
            }
            .accentColor(.white)
            
            if isLoading {
                LaunchScreenView().transition(.opacity).zIndex(1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                withAnimation { isLoading.toggle() }
            })
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ZzTabView()
    }
}
