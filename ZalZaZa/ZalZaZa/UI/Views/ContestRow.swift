//
//  ContestRow.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/11/23.
//

import SwiftUI

struct ContestRow: View {
    var items: [Contest]
    
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
                    ForEach(items) { contest in
                        ContestItem(contest: contest)
                    }
                }
            }
        }
    }
}

struct ContestRow_Previews: PreviewProvider {
    static var contests = ModelData().contests
    
    static var previews: some View {
        ContestRow(
            items: Array(contests.prefix(2))
        )
    }
}
