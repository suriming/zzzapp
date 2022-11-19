//
//  LaunchScreenView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/11.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("SubPrimaryColor")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Zalza")
                    .font(.system(size:50))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Image("LaunchMoon")
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
