//
//  SleepNavigationView.swift
//  ZalZaZa
//
//  Created by Changjun Oh on 2022/11/20.
//

import SwiftUI

struct SleepNavigationView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("MainViewColor")
                    .ignoresSafeArea()
                
                
                VStack(spacing: 0) {
                    GeometryReader { g in
                        NavigationLink(destination: Text("Private Sleep"),
                            label: {
                            
                            ZStack {
                                Image("PrivateSleep")
                                
                                Text("Private Sleep")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()

                            }
                            .padding(.top, 80)
                        })
                    }
                    
                    HStack(spacing: 0) {
                        GeometryReader { g in
                            NavigationLink(destination: Text("Sleep Contest"), label: {
                                ZStack {
                                    Image("SleepContest")
                                    
                                    Text("Sleep Contest")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                        .bold()
                                }
                                .padding(.leading, 40)
                                .position(x: g.size.width/2.2, y: g.size.height/2 - 2)
                            })
                        }

                        GeometryReader { g in
                            NavigationLink(destination: Text("Group Contest"), label: {
                                ZStack {
                                    Image("GroupContest")
                                    
                                    Text("Group Contest")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                        .bold()
                                }
                                .padding(.trailing, 10)
                                .position(x: g.size.width/2.2, y: g.size.height/2)
                            })
                        }
                    }
                }

            }
        }
    }
}

struct SleepNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SleepNavigationView()
    }
}
