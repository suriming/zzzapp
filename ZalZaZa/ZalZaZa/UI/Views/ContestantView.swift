//
//  ContestantView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import SwiftUI

struct ContestantView: View {
    
    var contestant:Contestant
    let progress: Double // Goal sleep time hard coded to 8
    
    init(contestant: Contestant) {
        self.contestant = contestant
        self.progress = (Double(contestant.lastSleepTimeHour) + Double(contestant.lastSleepTimeMinute)/60.0)/8.0
    }
    
    var body: some View {
        ZStack {
            Color("MainViewColor")
                .ignoresSafeArea()
            
            // MARK: Relative Container
            GeometryReader { g in
                
                // MARK: Intro Comment
                Text(contestant.name + "님의 \n지난 숙면 시간")
                    .foregroundColor(.white)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .position(x: g.size.width/2, y:g.size.height/8)
                
                // MARK: Circular Progress Bar
                CircularProgressView(progress: progress)
                    .frame(width: g.size.width/2, height: g.size.height/3)
                    .position(x: g.size.width/2, y:g.size.height/3)
                
                // MARK: Time Expression
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
                
                // MARK: Text Rectangle
                Text("숙면이 더 필요한 날입니다.")
                    .padding(10)
                    .multilineTextAlignment(.leading)
                    .frame(width: g.size.width/1.25, height: g.size.height/5.5)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .background(
                        Rectangle().fill(Color("MessageBoxColor"))
                            .cornerRadius(10)
                    )

                .position(x:g.size.width/2, y:g.size.height/1.65)

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
