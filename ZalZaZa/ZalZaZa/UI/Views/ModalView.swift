//
//  ModalView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/24.
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var model: ContestantModel
    @State private var date = Date()
    
    var body: some View {
        ZStack {
            Color("MessageBoxColor")
                .ignoresSafeArea()
            
            VStack {
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                
                SaveButton()
            }
            
        }
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(ContestantModel())
    }
}

struct SaveButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        VStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
            }
            
        }
    }
}
