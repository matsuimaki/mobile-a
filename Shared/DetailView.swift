//
//  DetailView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/10/20.
//
//タイムラインを押したときにポップアップさせる詳細情報

import SwiftUI

struct DetailView: View {
    
    @Binding var detail: Timeline
    
    var body: some View {
        List{
            Section(header: Text("日付")){
                Text(self.detail.month) + Text("月") + Text(self.detail.day) + Text("日")
            }
            Section(header: Text("場所")){
                Text(self.detail.location)
            }
            Section(header: Text("滞在時間")){
                Text(self.detail.time_h) + Text("時間") + Text(self.detail.time_m) + Text("分")
            }
        }
    }
}
