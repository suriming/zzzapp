//
//  Scenes.swift
//  ZalZaZa
//
//  Created by Sulim Chun on 2022/11/23.
//

import Foundation

import SwiftUI

struct Contest: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

 
