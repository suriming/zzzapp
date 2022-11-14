//
//  ContentView.swift
//  ZalZaZa
//
//  Created by 정은서 on 2022/11/09.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contestantModel = ContestantModel()
    
    var body: some View {
        VStack {
            ContestantView(contestant: contestantModel.contestants[0])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
