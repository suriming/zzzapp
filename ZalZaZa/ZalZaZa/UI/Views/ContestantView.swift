//
//  ContestantView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import SwiftUI

struct ContestantView: View {
    
    var contestant:Contestant
    
    var body: some View {
        ZStack {
            Color("MainViewColor")
                .ignoresSafeArea()
            
            GeometryReader { g in
                Text(contestant.name + "님의 \n지난 숙면 시간")
                    .foregroundColor(.white)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .position(x: g.size.width/2, y:g.size.height/8)
                
                CircularProgressView()
                    .frame(width: g.size.width/2, height: g.size.height/3)
                    .position(x: g.size.width/2, y:g.size.height/3)
                
                VStack {
                    HStack(alignment: .firstTextBaseline,spacing:0) {
                        Text(String(contestant.lastSleepTimeHour))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                        Text("h")
                            .foregroundColor(Color.white)
                    }
                    
                    HStack(alignment: .firstTextBaseline,spacing:0) {
                        Text(String(contestant.lastSleepTimeMinute))
                            .foregroundColor(Color.white)
                        Text("min")
                            .foregroundColor(Color.white)
                    }
                }
                .position(x: g.size.width/2, y:g.size.height/3)
            }
        }
    }
}

struct ContestantView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContestantModel()
        ContestantView(contestant: model.contestants[0])
    }
}
