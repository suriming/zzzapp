//
//  ContentView.swift
//  ZalZaZa
//
//  Created by 정은서 on 2022/11/09.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                Text("Hello, world")
            }
            .padding()
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
