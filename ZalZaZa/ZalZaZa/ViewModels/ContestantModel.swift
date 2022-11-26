//
//  ContestantModel.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import UIKit

class ContestantModel: ObservableObject {
    
    @Published var contestants = [Contestant]()
    private let db = Firestore.firestore()
    
    func updateData(selectedImage:UIImage?, birthdate:Date, email:String, height:Double, weight:Double) {
        // Upload selectedImage(check nil)
        
        db.collection("contestants").document(self.contestants[0].id)
            .setData(["birthdate":birthdate, "email":email, "height":height, "weight":weight], merge: true) { err in
                if let err = err {
                    print("Error updating the document: \(err)")
                } else {
                    self.getData()
                }
            }
    }
    
    func getData() {
    //        let db = Firestore.firestore()
            
            db.collection("contestants").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    // To change UI in the main thread
                    DispatchQueue.main.async {
                        var arr = [Contestant]()
                        for doc in querySnapshot!.documents {
                            var c = Contestant(id:"", name:"")
                            
                            c.id = doc.documentID
                            c.name = (doc["name"] as? String)!
                            c.height = doc["height"] as? Double ?? nil
                            c.weight = doc["weight"] as? Double ?? nil
                            c.age = doc["age"] as? Int ?? nil
                            c.image = doc["image"] as? String ?? nil
                            if let t = doc["birthdate"] as? Timestamp {
                                c.birthdate = t.dateValue()
                            } else {
                                c.birthdate = nil
                            }
                            c.email = doc["email"] as? String ?? nil
                            
                            c.lastSleepTimeHour = doc["lastSleepTimeHour"] as? Int ?? nil
                            c.lastSleepTimeMinute = doc["lastSleepTimeMinute"] as? Int ?? nil
                            c.maxSleepTimeHour = doc["maxSleepTimeHour"] as? Int ?? nil
                            c.maxSleepTimeMinute = doc["maxSleepTimeMinute"] as? Int ?? nil
                            
                            arr.append(c)
                            
                        }
                        
                        // destroy already created contestant array and assign a new one
                        self.contestants = arr
                        
//                        self.contestants = querySnapshot!.documents.map { doc in
//                            return Contestant(id: doc.documentID, name: doc["name"] as? String ?? "", lastSleepTimeHour: doc["lastSleepTimeHour"] as? Int ?? 0, lastSleepTimeMinute: doc["lastSleepTimeMinute"] as? Int ?? 0)
//                        }
                        
                    }
                    
                }
            }
        }
}
