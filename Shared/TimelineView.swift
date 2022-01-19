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
            VStack(spacing:30){
                ForEach(userData.timelines, id: \.id){ (timeline) in
                        HStack{
                            VStack(alignment: .leading, spacing:10){
                                Text(timeline.month).bold()+Text("月").bold()+Text(timeline.day).bold()+Text("日").bold()
                                Text(timeline.location)
                            }
                            Spacer()
                            ZStack{
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width:80, height:40)
                                    .shadow(color: Color("light"), radius: 5, x: -5, y: -5)
                                    .shadow(color: Color("dark"), radius: 5, x: 5, y: 5)
                                Text(timeline.time_h)+Text(" : ")+Text(timeline.time_m)
                            }
                        }
                        .foregroundColor(Color("string"))
                        .frame(width: UIScreen.main.bounds.width-80, height:50, alignment: .leading)
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture{self.isPresent.toggle()}
                        .padding()
                        .background(Color("base"))
                        .cornerRadius(10)
                        .compositingGroup()
                        .shadow(color: Color("light"), radius: 10, x: -10, y: -10)
                        .shadow(color: Color("dark"), radius: 10, x: 10, y: 10)
                        .id(timeline.id)
                }
                .sheet(isPresented: $isPresent){
                    DetailHostView()
                }
            }
    }
}
