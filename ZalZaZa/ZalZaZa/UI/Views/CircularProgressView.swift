//
//  CircularProgressView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/14.
//

import SwiftUI

struct CircularProgressView: View {
    
    // If drawingStroke is true, then start drawing on appear
    @State private var drawingStroke = false
    let progress: Double
    let animation = Animation
            .easeOut(duration: 1)
//            .repeatForever(autoreverses: false)
            .delay(0.5)
    
    var body: some View {
            ZStack {
                Circle()
                    .stroke(
                        Color.white,
                        lineWidth: 12
                    )
                Circle()
                    .trim(from: 0, to: drawingStroke ? progress : .leastNonzeroMagnitude)
                    .stroke(
                        LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color("CircularBottomColor"), location: 0.1), Gradient.Stop(color: Color("CircularTopColor"), location: 0.5)]), startPoint: .leading, endPoint: .trailing),
                        
                        style: StrokeStyle(
                            lineWidth: 12,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    
            }
            .animation(animation, value: drawingStroke)
            .onAppear {
                if drawingStroke == false { drawingStroke.toggle() }
            }
        }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        let progress: Double = 0.9
        CircularProgressView(progress: progress)
    }
}
