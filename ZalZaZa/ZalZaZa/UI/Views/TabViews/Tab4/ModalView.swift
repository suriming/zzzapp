//
//  ModalView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/24.
//

import SwiftUI

struct ModalView: View {
//    @ObservedObject var model = PreviewModel()  // MARK: For preview 1
    @EnvironmentObject var model:ContestantModel
    @State private var date = Date()
    @State private var email = ""
    @State private var height = ""
    @State private var weight = ""
    @State var isPickerShowing = false
    @Binding var showModal:Bool
    @Binding var selectedImage:UIImage?
    
    var body: some View {
        ZStack {
            Color("MessageBoxColor")
                .ignoresSafeArea()
            
            GeometryReader { g in
                VStack {
                    ZStack {

                        ProfilePicButton(isPickerShowing: isPickerShowing, selectedImage: $selectedImage, w: g.size.width/3, h: g.size.height/3, x: g.size.width/2, y:  g.size.height/2)
                        
                    }
                    
                    
                    DatePicker(
                        "Birthday: ",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .font(.system(size:25))
                    .colorScheme(.dark)
                    .padding(.horizontal, 50)
                    
                    HStack {
                        Text("E-mail: ")
                            .font(.system(size:25))
                            .foregroundColor(.white)
                        
                        TextField("Enter new email", text: $email)
                            .textFieldStyle(.roundedBorder)
//                            .disableAutocorrection(true)
                            
                    }
                    .padding(.horizontal, 50)
                    
                    HStack {
                        Text("Height: ")
                            .font(.system(size:25))
                            .foregroundColor(.white)

                        TextField("Enter your height", text: $height)
                            .textFieldStyle(.roundedBorder)
//                            .keyboardType(.numberPad)
//                            .disableAutocorrection(true)
                            
                    }
                    .padding(.horizontal, 50)
                    
                    HStack {
                        Text("Weight: ")
                            .font(.system(size:25))
                            .foregroundColor(.white)

                        TextField("Enter your weight", text: $weight)
                            .textFieldStyle(.roundedBorder)
//                            .keyboardType(.numberPad)
//                            .disableAutocorrection(true)
                            
                    }
                    .padding(.horizontal, 50)
                    
                    HStack {
                        SaveButton(selectedImage: selectedImage ?? nil, birthdate:date, email: email, height: Double(height) ?? 0.0, weight: Double(weight) ?? 0.0)
                        CloseButton(showModal: $showModal)
                    }

                }
                .position(x: g.size.width/2, y: g.size.height/3)
            }
            
        }
        .onAppear {
            date = model.contestants[0].birthdate ?? Date()
            email = model.contestants[0].email ?? ""
            height = String(model.contestants[0].height ?? 0.0)
            weight = String(model.contestants[0].weight ?? 0.0)
        }
        
    }
}

struct ModalView_Previews: PreviewProvider {
    
    static var previews: some View {
        ModalViewPreviewContainer()
    }
}

struct ModalViewPreviewContainer: View {
    @State var image:UIImage? = nil
    @State var showModal = false
    
    var body: some View {
        ModalView(showModal: $showModal, selectedImage: $image)
    }
}

struct SaveButton: View {
//    @ObservedObject var model = PreviewModel()  // MARK: For preview 2
    @EnvironmentObject var model:ContestantModel
    @EnvironmentObject var AuthModel:AuthViewModel
    var selectedImage:UIImage?
    var birthdate:Date
    var email:String
    var height:Double
    var weight:Double
    
    var body: some View {
        Button {
            model.updateDataWithUid(uid: AuthModel.currentUser!.uid, selectedImage: selectedImage, birthdate: birthdate, email: email, height: height, weight: weight)
        } label: {
            Text("Save")
        }
    }
}

struct CloseButton: View {
    
    @Binding var showModal:Bool
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button {
            showModal = false
//            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Close")
        }
    }
    
}

struct ProfilePicButton: View {
    @State var isPickerShowing:Bool
    @Binding var selectedImage:UIImage?
    @State var w:Double
    @State var h:Double
    @State var x:Double
    @State var y:Double
    @State var basePic:String = "CatInTheBox"
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(
                    LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color("CircularBottomColor"), location: 0.1), Gradient.Stop(color: Color("CircularTopColor"), location: 0.5)]), startPoint: .leading, endPoint: .trailing),
                    lineWidth: 15
                )
                .frame(width: w, height: h)
                .rotationEffect(.degrees(-90))
            
            Button {
                isPickerShowing = true
            } label: {
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: w, height: h)
                        .clipShape(Circle())
                } else {
                    Image(basePic)
                        .resizable()
                        .scaledToFit()
                        .frame(width: w, height: h)
                        .clipShape(Circle())
                }
            }
            .sheet(isPresented: $isPickerShowing) {
                // Image Picker
                ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
            }
        }
        .position(x: x, y: y)
    }
    
}
