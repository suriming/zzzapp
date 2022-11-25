//
//  ImagePicker.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/25.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage:UIImage?
    @Binding var isPickerShowing:Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        
        // .photoLibrary will be deprecated. Use PHPicker
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Run code when the user selected am image.
//        print("image selected")
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // We were able to get the image
            // update UI in the main thread
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
            
        }
        
        // Dismiss the picker
        parent.isPickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Run code when the user cancelled the picker UI
//        print("cancelled")
        
        // Dismiss the picker
        parent.isPickerShowing = false
    }
}
