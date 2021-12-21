//
//  TimelineView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/10/19.
//
//行動履歴を表示させるタイムライン

import SwiftUI

struct TimelineView: View {
    
    @State var isPresent = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
            VStack(spacing:15){
                ForEach(userData.timelines, id: \.id){ (timeline) in
                        Button(
                            action:{
                                self.isPresent.toggle()
                            }
                            ,label:{
                                HStack(){
                                    ZStack{
                                        Circle()
                                            .frame(width:30, height:30, alignment: .center)
                                            .foregroundColor(Color("Color1"))
                                        Text(timeline.day)
                                            //.fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                    }
                                    .padding(.leading,10)
                                    Text(timeline.location)
                                        .padding()
                                    Spacer()
                                    Divider()
                                        .padding(10)
                                    Group{
                                        Text(timeline.time_h) + Text("h") + Text(timeline.time_m) + Text("m")
                                    }
                                    .padding(.trailing)
                                }
                                .frame(width: UIScreen.main.bounds.width-100, height:50, alignment: .leading)
                                .background(Color("Color2"))
                                .cornerRadius(10)
                                .id(timeline.id)
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: $isPresent){
                            DetailHostView()
                        }
                    }
            }
    }
}
