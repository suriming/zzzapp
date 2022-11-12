//
//  Contestant.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import Foundation

struct Contestant: Identifiable, Decodable {
    // struct is immutable. If we had to change any properties,
    // struct type should be changed to class
    var id:String  // Assume id is given when data get fetched
    var pw:String
    var name:String
    var height:Float
    var weight:Float
    var age:Int
    
    var lastSleepTime:Float
    var maxSleepTime:Float
}
