//
//  DetailView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/10/20.
//
//タイムラインを押したときにポップアップさせる詳細情報

import SwiftUI

struct DetailView: View {
    
    @Binding var isPresent: Bool
    
    var body: some View {
        VStack(alignment: .trailing){
            Button(action: {
                withAnimation{
                    isPresent = false
                }
            }, label: {
                Image("Close2")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 30, height: 30)
            })
            .padding(.horizontal, 5)
            VStack{
                VStack(alignment: .leading){
                    ZStack{
                        Circle()
                            .frame(width:50, height:50, alignment: .center)
                            .foregroundColor(.blue)
                        Text("Date")
                            .fontWeight(.bold)
                    }
                    Text("Location")
                    Text("Staying Time")
                }
                .frame(width: UIScreen.main.bounds.width-40, alignment: .leading)
                Divider()
                HStack(alignment: .center,spacing: 15){
                    Button(action: {
                    
                    }){
                        Text("編集")
                    }
                    Button(action: {
                        
                    }){
                        Text("削除")
                    }
                    Button(action: {
                    
                    }){
                        Text("アーカイブ")
                    }
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            .frame(width: UIScreen.main.bounds.width-20)
            .background(Color.yellow)
            .cornerRadius(10)
        }
    }
}
