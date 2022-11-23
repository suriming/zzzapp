//
//  PreviewModel.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/24.
//

import Foundation

class PreviewModel: ObservableObject {
    
    @Published var contestants = [Contestant]()
    
    init() {
        self.contestants = DataService.getLocalData()
    }
}
