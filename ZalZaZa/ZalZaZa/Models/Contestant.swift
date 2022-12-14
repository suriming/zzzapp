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
    var pw:String?
    var name:String
    var height:Double?
    var weight:Double?
    var age:Int?
    var image:String?
    var birthdate:Date?
    var birthday:String?  // preview model
    var email:String?
    
    var lastSleepTimeHour:Int?
    var lastSleepTimeMinute:Int?
    var maxSleepTimeHour:Int?
    var maxSleepTimeMinute:Int?
}
