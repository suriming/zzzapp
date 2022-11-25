//
//  ProfileView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showModal = false
    @State var isPickerShowing = false
    @State var selectedImage:UIImage?
//    @ObservedObject var model = PreviewModel()
    @EnvironmentObject var model: ContestantModel
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yyyy.MM.dd"
    }
    
    var body: some View {
        ZStack {
            Color("MainViewColor")
                .ignoresSafeArea()
            
            GeometryReader { g in
                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.top, 30)
                
                VStack(alignment: .leading, spacing:0) {
                    ZStack {
                        Rectangle()
                            .fill(Color("MessageBoxColor"))
                            .frame(width: g.size.width-30, height: g.size.height/2.25)
                            .cornerRadius(10)
                        
                        Circle()
                            .stroke(
                                LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color("CircularBottomColor"), location: 0.1), Gradient.Stop(color: Color("CircularTopColor"), location: 0.5)]), startPoint: .leading, endPoint: .trailing),
                                lineWidth: 15
                            )
                            .frame(width: g.size.width/3, height: g.size.height/3)
                            .rotationEffect(.degrees(-90))
                            .position(x: g.size.width/2, y: 0)
                        
                        Button {
//                            print("hello")
                            isPickerShowing = true
                        } label: {
                            if selectedImage != nil {
                                Image(uiImage: selectedImage!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: g.size.width/3, height: g.size.height/3)
                                    .clipShape(Circle())
                            } else {
                                Image("CatInTheBox")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: g.size.width/3, height: g.size.height/3)
                                    .clipShape(Circle())
                            }
                            
                        }
                        .sheet(isPresented: $isPickerShowing) {
                            // Image Picker
                            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                        }
                        .position(x: g.size.width/2, y:0)
                        
                        
                        Text(model.contestants[0].name )
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.bottom)
                            .position(x: g.size.width/2, y: g.size.height/7)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            HStack {
                                // MARK: Birthday
                                ZStack {
                                    Text("Birthday")
                                        .foregroundColor(Color("CharColor"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.leading, .bottom])
                                    
                                    // firebase birthdate format
                                    // let t:Timestamp
                                    // let birthdate:Date = t.dateValue()
                                    if let date = model.contestants[0].birthdate {
                                        
                                        Text(dateFormatter.string(from: date))
                                            .foregroundColor(Color(.white))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 90)
                                            .padding(.bottom)

                                    } else {
                                        Text("")
                                    }
                                }
                            }
                            
                            HStack {
                                // MARK: Email
                                ZStack {
                                    Text("E-mail")
                                        .foregroundColor(Color("CharColor"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.leading, .bottom])
                                    
                                    if let e_mail = model.contestants[0].email {
                                        Text(e_mail)
                                            .foregroundColor(Color(.white))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 90)
                                            .padding(.bottom)
                                    } else {
                                        Text("")
                                    }
                                }
                            }
                            
                            HStack {
                                // MARK: Height
                                Text("Height")
                                    .foregroundColor(Color("CharColor"))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .bottom])
                                
                                if let h = model.contestants[0].height {
                                    Text(String(h) + String("cm"))
                                        .foregroundColor(Color(.white))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom)
                                } else {
                                    Text("")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom)
                                }
                                
                                // MARK: Weight
                                Text("Weight")
                                    .foregroundColor(Color("CharColor"))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .bottom])
                                
                                if let w = model.contestants[0].weight {
                                    Text(String(w) + String("kg"))
                                        .foregroundColor(Color(.white))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom)
                                } else {
                                    Text("")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom)
                                }
                                
                            }
                            
                            Divider()
                                .background(Color.white)
                                .padding(.horizontal)


                            HStack(alignment: .center) {
                               
                                    Button {
                                        self.showModal = true
                                    } label: {
                                        VStack {
                                            Image(systemName: "pencil")
                                                .foregroundColor(Color("CharColor"))
                                                .font(.system(size:30))
                                            
                                            Text("Edit profile")
                                                .foregroundColor(Color("CharColor"))
                                                .font(.system(size:15))
                                        }
                                    }
                                    .sheet(isPresented: self.$showModal) {
                                        ModalView()
                                    }
                                
                            }
                            .padding(.top, 10)
                            .frame(width: g.size.width-30)
                            
                        }
                        .padding(.top, 100)
                        .frame(width:g.size.width-30)
                        
                    }
                    .position(x: g.size.width/2, y: g.size.height/2)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color("MessageBoxColor"))
                            .frame(width: g.size.width-30, height: g.size.height/6)
                            .cornerRadius(10)
                        
                        Text("bottom box")
                            .foregroundColor(.white)
                    }
                    .position(x: g.size.width/2, y: g.size.height/3)
                }
            }
        }
        .onAppear {
            selectedImage = UIImage(contentsOfFile: model.contestants[0].image ?? "CatInTheBox")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    let model = PreviewModel()
    
    static var previews: some View {
        ProfileView()
//            .environmentObject(ContestantModel())
    }
}
