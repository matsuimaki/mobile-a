//
//  ContentView.swift
//  Shared
//
//  Created by Matsui Maki on 2021/10/19.
//
//全体
import SwiftUI

struct ContentView: View {
    
    @State var currentOffset = CGFloat.zero
    @State var openOffset = CGFloat.zero
    @State var closeOffset = CGFloat.zero
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack(alignment: .leading){
            //メインコンテンツ
            NavigationView{
                ZStack{
                    HStack {
                        Spacer()
                    }
                    
                    ScrollView(.vertical){
                        VStack{
                            TimelineView()
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
                .navigationBarItems(
                    leading: Button(
                        action: {
                            self.currentOffset = self.openOffset
                        })
                    {
                        Image("Hamburger2")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 30, height: 30)
                    }
                )
            }
            //スライドメニューの出現設定
            HamburgermenuView()
                .background(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.7)
                .edgesIgnoringSafeArea(.bottom)
                .onAppear(perform: {
                    self.currentOffset = UIScreen.main.bounds.width * -1
                    self.closeOffset = self.currentOffset
                    self.openOffset = .zero
                })
                .offset(x: self.currentOffset)
                .animation(.default)
        }.gesture(DragGesture(minimumDistance: 5)
                    .onEnded{value in
                        self.currentOffset = self.closeOffset
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
