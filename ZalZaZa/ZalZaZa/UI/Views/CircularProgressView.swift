//
//  CircularProgressView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/14.
//

import SwiftUI

struct CircularProgressView: View {
    var body: some View {
            ZStack {
                Circle()
                    .stroke(
                        Color.pink.opacity(0.5),
                        lineWidth: 30
                    )
                Circle()
                    .trim(from: 0, to: 0.25)
                    .stroke(
                        Color.pink,
                        // 1
                        style: StrokeStyle(
                            lineWidth: 30,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
            }
        }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
