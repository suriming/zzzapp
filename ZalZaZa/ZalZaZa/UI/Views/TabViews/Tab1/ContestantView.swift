//
//  ContestantView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import SwiftUI

struct ContestantView: View {
    
    @EnvironmentObject var model:ContestantModel
    @EnvironmentObject var AuthModel:AuthViewModel
    @State var uid:String?
    @State var contestant:Contestant = Contestant(id:"", name:"New Member", lastSleepTimeHour: 0, lastSleepTimeMinute: 0)
    @State var progress: Double = 0.0 // Goal sleep time hard coded to 8
    var str:String = "숙면이 더 필요한 날입니다."
    var testData:[[Int]] = [[2,30],[6,35],[4,5],[3,35],[5,15],[3,15],[6,30]]
    
    var body: some View {
        ZStack {
            Color("MainViewColor")
                .ignoresSafeArea()
            
            ContestantMainView(contestant: contestant, progress: progress, str: str)
        }
        .onAppear {
            self.uid = AuthModel.currentUser?.uid
            model.getData(uid: self.uid!)
            contestant = model.contestants[0]
            progress = (Double(contestant.lastSleepTimeHour!) + Double(contestant.lastSleepTimeMinute!)/60.0)/8.0
        }
        // EnviromentObjest is passed down when body is called
        // It does not exist during the initialization phase of the View struct
    }
}


struct TimeExpressionView: View {
    var contestant:Contestant
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline,spacing:0) {
                Text(String(contestant.lastSleepTimeHour!))
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                Text("h")
                    .foregroundColor(Color.white)
            }
            
            HStack(alignment: .firstTextBaseline,spacing:0) {
                Text(String(contestant.lastSleepTimeMinute!))
                    .foregroundColor(Color.white)
                Text("min")
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContestantMainView: View {
    
    var contestant:Contestant
    var progress:Double
    var str:String
    
    var body: some View {
        
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
            TimeExpressionView(contestant: contestant)
                .position(x: g.size.width/2, y:g.size.height/3)
            
            // MARK: Text Rectangle
            Text(str)
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

struct ContestantView_Previews: PreviewProvider {
    static var previews: some View {
//        let model = ContestantModel()
        ContestantView()
            .environmentObject(ContestantModel())
    }
}
