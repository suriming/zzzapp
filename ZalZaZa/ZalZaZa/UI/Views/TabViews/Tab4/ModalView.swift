//
//  ModalView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/24.
//

import SwiftUI

struct ModalView: View {
    
//    @ObservedObject var model = PreviewModel()
    @EnvironmentObject var model:ContestantModel
    @State private var date = Date()
    @State private var email = ""
    @State private var height = ""
    
    var body: some View {
        ZStack {
            Color("MessageBoxColor")
                .ignoresSafeArea()
            
            GeometryReader { g in
                VStack {
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
                        SaveButton(birthdate:date, email: email, height: Double(height) ?? 0.0)
                        CloseButton()
                    }
                    

                }
                .position(x: g.size.width/2, y: g.size.height/2)
            }
            
        }
        .onAppear {
            date = model.contestants[0].birthdate ?? Date()
            email = model.contestants[0].email ?? ""
            height = String(model.contestants[0].height ?? 0.0)
        }
        
    }
}

struct ModalView_Previews: PreviewProvider {
    @State var model = PreviewModel()
    static var previews: some View {
        ModalView()
            .environmentObject(ContestantModel())
    }
}

struct SaveButton: View {
    
    @EnvironmentObject var model:ContestantModel
    var birthdate:Date
    var email:String
    var height:Double
//    var weight:Double
    
    var body: some View {
        Button {
            model.updateData(birthdate: birthdate, email: email, height: height)
        } label: {
            Text("Save")
        }
    }
}

struct CloseButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Close")
        }
    }
    
}
