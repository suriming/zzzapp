//
//  ContestantModel.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/12.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage

class ContestantModel: ObservableObject {
     
    @Published var contestants = [Contestant]()
    @Published var profilePhoto:UIImage?
    private let db = Firestore.firestore()
    
    func updateDataWithUid(uid:String, selectedImage:UIImage?, birthdate:Date, email:String, height:Double, weight:Double) {
        // Upload selectedImage(check nil)
        if let im = selectedImage {
            uploadPhoto(selectedImage: im)
        }
        
        self.db.collection("contestants").document(self.contestants[0].id)
            .setData(["birthdate":birthdate, "email":email, "height":height, "weight":weight], merge: true) { err in
                if let err = err {
                    print("Error updating the document: \(err)")
                } else {
                    self.getData(uid: uid)
                }
            }
    }
    
    func updateData(selectedImage:UIImage?, birthdate:Date, email:String, height:Double, weight:Double) {
        // Upload selectedImage(check nil)
        if let im = selectedImage {
            uploadPhoto(selectedImage: im)
        }
        
        self.db.collection("contestants").document(self.contestants[0].id)
            .setData(["birthdate":birthdate, "email":email, "height":height, "weight":weight], merge: true) { err in
                if let err = err {
                    print("Error updating the document: \(err)")
                } else {
                    self.getData()
                }
            }
    }
    
    func uploadPhoto(selectedImage:UIImage) {
        
        // Create a root reference
        let storageRef = Storage.storage().reference()
        
        let imageData = selectedImage.jpegData(compressionQuality: 0.8)
        guard imageData != nil else { return }
        
        // Specify the file path and name
        let path = "images/\(self.contestants[0].id).jpg"
        let fileRef = storageRef.child(path)
        
        // Upload the file to the path "images/\(UUID().uuidString).jpg"
        fileRef.putData(imageData!, metadata: nil) { metadata, err in
            guard metadata != nil else {
                // Uh-oh, an error occurred!
                print("Error uploading the data: \(String(describing: err))")
                return
            }
            
            // TODO: Save a reference to the file in Firestore DB
            self.db.collection("contestants").document(self.contestants[0].id)
                .setData(["image":path], merge: true) { err in
                    if let err = err {
                        print("Error uploading the photo: \(err)")
                    } else {
                        DispatchQueue.main.async {
                            self.profilePhoto = selectedImage
                        }
                    }
                }
        }
    }
    
    func downloadPhoto(imageUrl:String) {
        
        // Create a root reference
        let storageRef = Storage.storage().reference()
        
        // Create a reference to the file you want to download
        let imageRef = storageRef.child(imageUrl)
        
        // Download in memory with a maximum allowed size of 5MB (5 * 1024 * 1024 bytes)
        imageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print("Error downloading the photo: \(error)")
            } else {
                // Data is returned
                if let image = UIImage(data: data!) {
                    
                    DispatchQueue.main.async {
                        self.profilePhoto = image
                    }
                    
                }
            }
        }

    }
    
    func getData(uid:String) {
        self.db.collection("contestants").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                // To change UI in the main thread
                DispatchQueue.main.async {
                    var arr = [Contestant]()
                    for doc in querySnapshot!.documents {
                        if doc.documentID == uid {
                            var c = Contestant(id:"", name:"")
                            
                            c.id = doc.documentID
                            c.name = (doc["name"] as? String)!
                            c.height = doc["height"] as? Double ?? nil
                            c.weight = doc["weight"] as? Double ?? nil
                            c.age = doc["age"] as? Int ?? nil
                            if let im = doc["image"] as? String {
                                self.downloadPhoto(imageUrl: im)
                            } else {
                                c.image = nil
                            }
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
                    }
                    
                    // destroy already created contestant array and assign a new one
                    self.contestants = arr
                    
                }
                
            }
        }
    }
    
    func getData() {
    //        let db = Firestore.firestore()
            
            self.db.collection("contestants").getDocuments() { (querySnapshot, err) in
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
                            if let im = doc["image"] as? String {
                                self.downloadPhoto(imageUrl: im)
                            } else {
                                c.image = nil
                            }
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
