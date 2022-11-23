//
//  SleepContestView.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/11/16.
//

import SwiftUI

struct SleepContestView: View {
//    var mapName: String
    
    var body: some View {
        ZStack {
            NavigationView{
                Text("Hello")
                    .navigationTitle("Sleep Contest")
                    .foregroundColor(.white)
            }
            Color("MainViewColor")
                .ignoresSafeArea()
        }
    }
}

struct SleepContestView_Previews: PreviewProvider {
    static var previews: some View {
        SleepContestView()
    }
}
