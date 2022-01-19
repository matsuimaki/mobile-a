//
//  ContentView.swift
//  Shared
//
//  Created by Matsui Maki on 2021/10/19.
//
//全体
import SwiftUI

struct ContentView: View {
    
    @State var showingmenu = false
    
    @EnvironmentObject var userData: UserData
    
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().barTintColor = UIColor(red:230/255,green:240/255,blue:250/255,alpha: 1)
        
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            //メインコンテンツ
            NavigationView{
                ZStack{
                    Color("base").ignoresSafeArea()
                    ScrollView(.vertical){
                        TimelineView()
                            .frame(width:UIScreen.main.bounds.width)
                            .padding(.top, 30)
                    }
                    if showingmenu{
                        Color("dark").opacity(0.9)
                            .edgesIgnoringSafeArea(.bottom)
                        HamburgermenuView(isShowing: $showingmenu)
                    }
                }
                //タイトル
                .navigationBarTitle("Location History", displayMode: .inline)
                //ハンバーガーメニューボタンの配置
               .navigationBarItems(
                   leading: Button(
                       action: {
                           withAnimation{showingmenu=true}
                       }
                   ){
                       Image("menu")
                           .renderingMode(.original)
                           .resizable()
                           .frame(width: 40, height: 40)
                           .shadow(color: Color("light"), radius: 5, x: -5, y: -5)
                           .shadow(color: Color("dark"), radius: 5, x: 5, y: 5)
                   }.padding(.bottom, 10)
               )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
