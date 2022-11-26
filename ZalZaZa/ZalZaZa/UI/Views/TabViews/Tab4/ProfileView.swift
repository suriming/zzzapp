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
    @ObservedObject var model = PreviewModel()
//    @EnvironmentObject var model: ContestantModel
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "yyyy.MM.dd"
    }
    
    var body: some View {
        ZStack {
            Color("MainViewColor")
                .ignoresSafeArea()
            
            GeometryReader { g in
                ProfileText()
                
                VStack(alignment: .leading, spacing:0) {
                    ZStack {
                        ProfileBox(w:g.size.width-30, h:g.size.height/2.25, r:10)
                        
                        ProfileCircle(w: g.size.width/3, h: g.size.height/3, x: g.size.width/2, y: 0)
                        
//                        ProfilePicButton(isPickerShowing: isPickerShowing, selectedImage: selectedImage, w: g.size.width/3, h: g.size.height/3, x: g.size.width/2, y: 0)
                        
                        ProfileName(name: model.contestants[0].name, x: g.size.width/2, y: g.size.height/7)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            // MARK: Birthday
                            Birthday(date: model.contestants[0].birthdate, dateFormatter: dateFormatter)
                            
                            // MARK: Email
                            Email(email: model.contestants[0].email)
                            
                            // MARK: Height and Weight
                            HeightAndWeight(height: model.contestants[0].height, weight: model.contestants[0].weight)
                            
                            Divider()
                                .background(Color.white)
                                .padding(.horizontal)

                            // MARK: Edit Profile
                            EditProfile(showModal: showModal, w: g.size.width-30)
                            
                        }
                        .padding(.top, 100)
                        .frame(width:g.size.width-30)
                        
                    }
                    .position(x: g.size.width/2, y: g.size.height/2)
                    
                    ZStack {
                        ProfileBox(w: g.size.width-30, h: g.size.height/6, r: 10)
                        
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
    
//    let model = PreviewModel()
    
    static var previews: some View {
        ProfileView()
//            .environmentObject(ContestantModel())
    }
}

struct ProfileText: View {
    var body: some View {
        Text("Profile")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding(.leading)
            .padding(.top, 30)
    }
}

struct ProfileBox: View {
    @State var w:Double
    @State var h:Double
    @State var r:Double
    
    var body: some View {
        Rectangle()
            .fill(Color("MessageBoxColor"))
            .frame(width: w, height: h)
            .cornerRadius(r)
    }
}

struct ProfileCircle: View {
    @State var selectedImage:UIImage?
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
        .position(x: x, y: y)
    }
}


struct ProfileName: View {
    @State var name:String
    @State var x:Double
    @State var y:Double
    
    var body: some View {
        Text(name)
            .foregroundColor(.white)
            .font(.title)
            .bold()
            .padding(.bottom)
            .position(x: x, y: y)
    }
}

struct Birthday: View {
    @State var date:Date?
    @State var dateFormatter:DateFormatter
    
    var body: some View {
        HStack {
            ZStack {
                Text("Birthday")
                    .foregroundColor(Color("CharColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom])
                
                // firebase birthdate format
                // let t:Timestamp
                // let birthdate:Date = t.dateValue()
                if let d = date {
                    
                    Text(dateFormatter.string(from: d))
                        .foregroundColor(Color(.white))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 90)
                        .padding(.bottom)
                    
                } else {
                    Text("")
                }
            }
        }
    }
}

struct Email: View {
    @State var email:String?
    
    var body: some View {
        HStack {
            ZStack {
                Text("E-mail")
                    .foregroundColor(Color("CharColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom])
                
                if let e_mail = email {
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
    }
}

struct HeightAndWeight: View {
    @State var height:Double?
    @State var weight:Double?
    
    var body: some View {
        HStack {
            Text("Height")
                .foregroundColor(Color("CharColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .bottom])
            
            if let h = height {
                Text(String(h) + String("cm"))
                    .foregroundColor(Color(.white))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
            } else {
                Text("")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
            }
            
            Text("Weight")
                .foregroundColor(Color("CharColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .bottom])
            
            if let w = weight {
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
    }
    
}

// include EnvironmentObject
struct EditProfile: View {
//    @EnvironmentObject var model: ContestantModel
    @State var showModal:Bool
    @State var w:Double
    
    var body: some View {
        HStack(alignment: .center) {
           
                Button {
                    showModal = true
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
                .sheet(isPresented: $showModal) {
//                    ModalView()
                }
            
        }
        .padding(.top, 10)
        .frame(width: w)
    }
}
