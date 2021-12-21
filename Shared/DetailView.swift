//
//  DetailView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/10/20.
//
//タイムラインを押したときにポップアップさせる詳細情報

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var userData: UserData
    @State var theID = 1
    
    var body: some View {
        
        let month: String = userData.timelines[self.theID].month
        let day: String = userData.timelines[self.theID].day
        let location: String = userData.timelines[self.theID].location
        let time_h: String = userData.timelines[self.theID].time_h
        let time_m: String = userData.timelines[self.theID].time_m
        

        List{
            Section(header: Text("日付")){
                Text(month) + Text("月") + Text(day) + Text("日")
            }
            Section(header: Text("場所")){
                Text(location)
            }
            Section(header: Text("滞在時間")){
                Text(time_h) + Text("時間") + Text(time_m) + Text("分")
            }
        }
    }
}
