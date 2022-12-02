//
//  SleepContestView.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/11/23.
//

import Foundation
import SwiftUI

struct SleepContestView: View {
//    var mapName: String
    @State var tag:Int? = nil
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            
            ZStack(){
                Color("MainViewColor")
                VStack(){
//                    Text("Sleep Contest")
//                        .foregroundColor(.white)
                    
                    ContestRow(items: Array(ModelData().contests))
                        .padding(.vertical, 100)
                    NavigationLink(destination: SpaceView(),
                       label: {
                           ZStack {
                               Rectangle()
                                   .frame(width: 350, height: 50)
                                   .background(.blue)
                                   .foregroundColor(.blue)
                                   .cornerRadius(50)
                               Text("Start")
                                   .foregroundColor(.white)
                                   .font(.system(size:20))
                           }
                       })
                    
                }
            }
            .navigationTitle("Sleep contest")
            .accentColor(.white)
            .foregroundColor(.white)
            .ignoresSafeArea()
        }
    }
}

struct SleepContestView_Previews: PreviewProvider {
    static var previews: some View {
        SleepContestView()
    }
}
