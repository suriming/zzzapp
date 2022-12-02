//
//  PreviewModel.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/24.
//

import Foundation
import SwiftUI

class PreviewModel: ObservableObject {
    
    @Published var contestants = [Contestant]()
    
    init() {
        self.contestants = DataService.getLocalData()
    }
    
    func updateData(selectedImage:UIImage?, birthdate:Date, email:String, height:Double, weight:Double) {
        // do nothing, dummy function
    }

}
