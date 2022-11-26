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
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("MainViewColor")
                    .ignoresSafeArea()
            }
            .navigationTitle("Sleep Contest")
            .foregroundColor(Color.white)
        }
    }
}

struct SleepContestView_Previews: PreviewProvider {
    static var previews: some View {
        SleepContestView().environmentObject(ModelData())
    }
}
