//
//  EditorView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/12/14.
//

import SwiftUI

struct EditorView: View {
    
    @EnvironmentObject var userData: UserData
    @State var theID = 1
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(red:230/255,green:240/255,blue:250/255,alpha: 1)
    }
    
    var body: some View {
        List{
            Section(header: Text("場所")){
                TextField("場所",text:$userData.timelines[theID].location)
            }
            Section(header: Text("滞在時間")){
                TextField("時間", text:$userData.timelines[theID].time_h)
            }
        }
    }
}
