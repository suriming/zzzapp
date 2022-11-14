//
//  TabView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/13.
//

import SwiftUI

struct ZzTabView: View {
    
    // In order to start drawing the circular bar
    // as the launching screen gets over
    @State var tabIndex = 1
    @State var isLoading: Bool = true
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $tabIndex) {
                
                // MARK: Tab 1
                ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, .none)
                    }
                }
                .tag(0)
                
                // MARK: Tab 2
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
                
                // MARK: Tab 3
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
                
                // MARK: Tab 4
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
                
                // Change the tab to tab 1
                // And start drawing the circular bar
                tabIndex = 0
            })
        }
        
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ZzTabView()
    }
}
