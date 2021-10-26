//
//  ContentView.swift
//  Shared
//
//  Created by Matsui Maki on 2021/10/19.
//
//全体

import SwiftUI

class Timeline:ObservableObject{
    @Published var id: Int = 0
    @Published var month: String = ""
    @Published var day: String = ""
    @Published var location: String = ""
    @Published var time_h: String = ""
    @Published var time_m: String = ""
    
    init(id: Int, month: String, day: String, location: String, time_h: String, time_m: String){
        self.id = id
        self.month = month
        self.day = day
        self.location = location
        self.time_h = time_h
        self.time_m = time_m
    }
}

struct ContentView: View {
    
    @State public var currentOffset = CGFloat.zero
    @State public var openOffset = CGFloat.zero
    @State public var closeOffset = CGFloat.zero
    
    @State public var timelines: [Timeline] = [
        Timeline(id:0, month: "10",day: "1", location: "大学", time_h:"2h", time_m: "01m"),
        Timeline(id:1, month: "10",day: "5", location: "バイト", time_h:"6h",time_m: "23m"),
        Timeline(id:2, month: "10",day: "6", location: "ライカム", time_h:"5h", time_m: "24m"),
        Timeline(id:3, month: "10",day: "7", location: "大学", time_h:"2h", time_m: "01m"),
        Timeline(id:4, month: "10",day: "9", location: "バイト", time_h:"6h",time_m: "23m"),
        Timeline(id:5, month: "10",day: "10", location: "ライカム", time_h:"5h", time_m: "24m"),
        Timeline(id:6, month: "10",day: "11", location: "大学", time_h:"2h", time_m: "01m"),
        Timeline(id:7, month: "10",day: "15", location: "バイト", time_h:"6h",time_m: "23m"),
        Timeline(id:8, month: "10",day: "23", location: "ライカム", time_h:"5h", time_m: "24m"),
        Timeline(id:9, month: "10",day: "25", location: "大学", time_h:"2h", time_m: "01m"),
        Timeline(id:10, month: "10",day: "30", location: "バイト", time_h:"6h",time_m: "23m"),
        Timeline(id:11, month: "10",day: "31", location: "ライカム", time_h:"5h", time_m: "24m")
    ]
    
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: .leading){
                //メインコンテンツ
                NavigationView{
                    ZStack{
                        ScrollView(.vertical){
                            VStack{
                                TimelineView(timelines: $timelines)
                            }
                        }
                        //メニューを押されたら背景をグレーアウトする
                        Color.gray.opacity(
                            Double((self.closeOffset  - self.currentOffset)/self.closeOffset) - 0.4
                        )
                    }
                    //タイトル
                    .navigationBarTitle("Location History", displayMode: .inline)
                    //ハンバーガーメニューボタンの配置
                    .navigationBarItems(leading: Button(action: {
                        self.currentOffset = self.openOffset
                    }){
                        Image("Hamburger2")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                }
                //スライドメニューの出現設定
                HamburgermenuView()
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.7)
                    .edgesIgnoringSafeArea(.bottom)
                    .onAppear(perform: {
                        self.currentOffset = geometry.size.width * -1
                        self.closeOffset = self.currentOffset
                        self.openOffset = .zero
                    })
                    .offset(x: self.currentOffset)
                    .animation(.default)
            }
            .gesture(DragGesture(minimumDistance: 5)
                        //スライドメニューを消すジェスチャー
                        .onEnded{value in
                                self.currentOffset = self.closeOffset
                        }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

