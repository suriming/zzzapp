//
//  ContestantModel.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class ContestantModel: ObservableObject {
    
    @Published var contestants = [Contestant]()
    private let db = Firestore.firestore()
    
    
    func getData() {
    //        let db = Firestore.firestore()
            
            db.collection("contestants").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    // To change UI in the main thread
                    DispatchQueue.main.async {
                        
                        self.contestants = querySnapshot!.documents.map { doc in
                            return Contestant(id: doc.documentID, name: doc["name"] as? String ?? "", lastSleepTimeHour: doc["lastSleepTimeHour"] as? Int ?? 0, lastSleepTimeMinute: doc["lastSleepTimeMinute"] as? Int ?? 0)
                        }
                        
                    }
                    
                }
            }
        }
}
