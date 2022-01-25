//
//  DetailHostView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/12/21.
//

import SwiftUI

struct DetailHostView: View {
    
    @Binding var theID: Int
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draft_detail: Timeline = Timeline(id:0, month: "_",day: "_", location: "_", time_h:"_", time_m: "_")
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
            if mode?.wrappedValue == .active {
                Button("Cancel"){
                    self.draft_detail = self.userData.timelines[self.theID]
                    print("cancel")
                    mode?.animation().wrappedValue = .inactive
                }
            }
            Spacer()
            EditButton()
            }
            .padding(20)
          if mode?.wrappedValue == .inactive {
            DetailView(detail: $userData.timelines[self.theID])
                  .onAppear{
                      UITableView.appearance().backgroundColor = UIColor(red:230/255,green:240/255,blue:250/255,alpha: 1)
                  }
          }else{
              EditorView(draft_detail: $draft_detail)
                  .onAppear{
                      self.draft_detail = self.userData.timelines[self.theID]
                      UITableView.appearance().backgroundColor = UIColor(red:230/255,green:240/255,blue:250/255,alpha: 1)
                  }
                  .onDisappear{
                      self.userData.timelines[self.theID] = self.draft_detail
                  }
          }
        }
        .foregroundColor(Color("string"))
        .background(Color("base"))
    }
}
