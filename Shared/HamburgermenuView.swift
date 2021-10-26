//
//  HamburgermenuView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/10/19.
//
//スライドメニューの中身

import SwiftUI

struct HamburgermenuView: View {
    
    @State private var OnOff = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("設定")
                .font(.largeTitle)
                .padding(.top, 30)
            Divider()
            ScrollView(.vertical, showsIndicators: true){
                Toggle("位置情報記録", isOn: $OnOff)
                Text(String(OnOff))
            }
            .padding(.top,10)
        }
        .padding(.horizontal, 20)
    }
}

struct HamburgermenuView_Previews: PreviewProvider {
    static var previews: some View {
        HamburgermenuView()
    }
}
