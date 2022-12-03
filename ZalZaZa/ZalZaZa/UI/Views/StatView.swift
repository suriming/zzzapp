//
//  StatView.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/12/03.
//

import SwiftUI
import Charts

struct PoseEval: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}

struct Volatility: Identifiable {
    var type: String
    var score: Double
    var id = UUID()
}

struct StatView: View {
    var stackedBarData: [PoseEval] = [
        .init(color: "Good", type: "Monday", count: 60),
        .init(color: "Bad", type: "Monday", count: 20),
        .init(color: "Bad", type: "Tuesday", count: 30),
        .init(color: "Good", type: "Tuesday", count: 40),
        .init(color: "Good", type: "Wednesday", count: 80),
        .init(color: "Bad", type: "Thursday", count: 20),
        .init(color: "Good", type: "Thursday", count: 20),
        .init(color: "Bad", type: "Friday", count: 40),
        .init(color: "Good", type: "Friday", count: 10),
        .init(color: "Bad", type: "Saturday", count: 10),
        .init(color: "Good", type: "Saturday", count: 20),
        .init(color: "Bad", type: "Sunday", count: 30),
        .init(color: "Good", type: "Sunday", count: 40)
    ]
    
    var plotData: [Volatility] = [
        .init(type: "0:00", score: 0),
        .init(type: "1:00", score: 20),
        .init(type: "2:00", score: 40),
        .init(type: "3:00", score: 50),
        .init(type: "4:00", score: 23),
        .init(type: "5:00", score: 18),
        .init(type: "6:00", score: 22)
        
    ]
//    var data: [ToyShape] = [
//        .init(type: "Cube", count: 5),
//        .init(type: "Sphere", count: 4),
//        .init(type: "Pyramid", count: 4)
//    ]
    
    var body: some View {
        ZStack{
            Color("MainViewColor")
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0){
                Text("Report")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.top, 30)
                Text("Today")
                    .font(.system(size:15))
                    .padding(.vertical, 8)
                    .padding(.leading)
                Chart{
                    ForEach(plotData) { time in
                        LineMark(
                            x: .value("time", time.type),
                            y: .value("score", time.score)
                        )
                        .foregroundStyle(.yellow)
                    }
                }
                Text("Recent")
                    .font(.system(size:15))
                    .padding(.vertical, 8)
                    .padding(.leading)
                Chart {
                    ForEach(stackedBarData) { shape in
                        BarMark(
                            x: .value("Evaluation", shape.type),
                            y: .value("Counts", shape.count)
                        )
                        .foregroundStyle(by: .value("Shape Color", shape.color))
                    }
                }
                .foregroundColor(.white)
                .padding(.vertical, 70)
                .frame(height: 410)
                .padding(.leading)
                
            }
            .foregroundColor(.white)
            .accentColor(.white)
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView()
    }
}
