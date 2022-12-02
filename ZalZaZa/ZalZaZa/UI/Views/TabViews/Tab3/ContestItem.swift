//
//  ContestItem.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/11/24.
//

import SwiftUI

struct ContestItem: View {
    var contest: Contest
    
    var body: some View {
        VStack(alignment: .leading){
            Text(contest.name)
                .font(.title)
            contest.image
                .resizable()
                .frame(width: 280, height: 285)
                .cornerRadius(5)
        }
        .padding(.leading, 15)
    }
}

struct ContestItem_Previews: PreviewProvider {
    static var previews: some View {
        ContestItem(contest: ModelData().contests[0])
    }
}
