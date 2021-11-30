//
//  TimelineView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/10/19.
//
//行動履歴を表示させるタイムライン

import SwiftUI

struct TimelineView: View {
    
    @State var showingPopUp = false
    @Binding var timelines: [Timeline]
    
    var body: some View {
        ZStack{
            VStack(spacing:15){
                    ForEach(self.timelines, id: \.id){ (timeline) in
                        Button(
                            action:{
                                withAnimation{
                                    showingPopUp = true
                                }
                            }
                            ,label:{
                                HStack(){
                                    ZStack{
                                        Circle()
                                            .frame(width:30, height:30, alignment: .center)
                                            .foregroundColor(.blue)
                                        Text(timeline.day)
                                            .fontWeight(.bold)
                                    }
                                    .padding(.leading,10)
                                    Text(timeline.location)
                                        .padding()
                                    Spacer()
                                    Divider()
                                        .padding(10)
                                    Group{
                                        Text(timeline.time_h) + Text(timeline.time_m)
                                    }
                                    .padding(.trailing)
                                }
                                .frame(width: UIScreen.main.bounds.width-50, height:50, alignment: .leading)
                                .background(Color.yellow)
                                .cornerRadius(10)
                                .id(timeline.id)
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            if showingPopUp{
                Color.gray.opacity(0.8)
                    //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                DetailView(isPresent: $showingPopUp)
                    .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/3)
            }
        }
    }
}
