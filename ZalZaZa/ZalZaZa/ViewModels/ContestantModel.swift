//
//  ContestantModel.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import Foundation

class ContestantModel: ObservableObject {
    
    @Published var contestants = [Contestant]()
    
    init() {
        self.contestants = DataService.getLocalData()
    }
}
