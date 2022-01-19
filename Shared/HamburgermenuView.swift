//
//  HamburgermenuView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/10/19.
//
//スライドメニューの中身

import SwiftUI

struct HamburgermenuView: View {
    
    @Binding var isShowing: Bool
    @State private var OnOff = false
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("設定")
                    .font(.title)
                Divider()
                Toggle("位置情報記録", isOn: $OnOff)
                    .toggleStyle(SwitchToggleStyle(tint:Color("accent")))
                    .padding(.bottom,20)
            }
            Button(action:{
                withAnimation{
                    isShowing = false
                }
            },label:{
                Text("Close")
            })
        }
        .padding()
        .foregroundColor(Color("string"))
        .frame(width:280, alignment: .center)
        .background(Color("light"))
        .cornerRadius(20)
    }
}
