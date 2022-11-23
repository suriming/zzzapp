//
//  ProfileView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var model = PreviewModel()
//    @EnvironmentObject var model: ContestantModel
    
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
                        
                        Image(model.contestants[0].image ?? "CatInTheBox")
                            .resizable()
                            .scaledToFit()
                            .frame(width: g.size.width/3, height: g.size.height/3)
                            .clipShape(Circle())
                            .position(x: g.size.width/2, y:0)
                        
                        
                        Text(model.contestants[0].name)
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.bottom)
                            .position(x: g.size
                                .width/2, y: g.size.height/7)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Birthday")
                                    .foregroundColor(Color("CharColor"))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .bottom])
                            }
                            
                            HStack {
                                Text("Email")
                                    .foregroundColor(Color("CharColor"))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding([.leading, .bottom])
                            }
                            
                            HStack {
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
                                }
                                
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
                                }
                                
                            }
                            
                        }
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
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    let model = PreviewModel()
    
    static var previews: some View {
        ProfileView()
//            .environmentObject(ContestantModel())
    }
}
