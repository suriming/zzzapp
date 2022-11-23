//
//  ContentView.swift
//  ZalZaZa
//
//  Created by 정은서 on 2022/11/09.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var contestantModel = ContestantModel()
    @EnvironmentObject var model: ContestantModel
    
    var body: some View {
        VStack {
            ContestantView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContestantModel())
    }
}
