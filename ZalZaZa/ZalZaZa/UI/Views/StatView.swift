//
//  StatView.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/12/03.
//

import SwiftUI
import Charts

struct ToyShape: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}

struct StatView: View {
    var stackedBarData: [ToyShape] = [
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
                Text("Recent")
                    .font(.system(size:25))
                Chart {
                    ForEach(stackedBarData) { shape in
                        BarMark(
                            x: .value("Shape Type", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                        .foregroundStyle(by: .value("Shape Color", shape.color))
                    }
                }
                .foregroundColor(.white)
                .padding(.vertical, 70)
                .frame(height: 430)
            }
            .foregroundColor(.white)
            .accentColor(.white)
            .padding(.horizontal, 15)
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView()
    }
}
