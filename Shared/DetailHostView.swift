//
//  DetailHostView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/12/21.
//

import SwiftUI

struct DetailHostView: View {
    
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
            if mode?.wrappedValue == .active {
                Button("Cancel"){
                    mode?.animation().wrappedValue = .inactive
                }
            }
            Spacer()
            EditButton()
            }
            .padding(20)
          if mode?.wrappedValue == .inactive {
            DetailView()
          }else{
            EditorView()
              //.onAppear {}
              //.onDisappear {}
          }
        }
        .foregroundColor(Color("string"))
        .background(Color("base"))
        
    }
}
