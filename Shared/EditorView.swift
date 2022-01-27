//
//  EditorView.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/12/14.
//

import SwiftUI

struct EditorView: View {
    
    @Binding var draft_detail: Timeline
    
    @State var DatePickerVisible = false
    @State var TimePickerVisible = false
    @State var tbd_month = "1"
    @State var tbd_day = "1"
    @State var Months = Array(1...12)
    @State var Days: [Int] = Array(1...31)

    
    var body: some View {
            List{
                Section(header: Text("日付")){
                    HStack(spacing:1){
                        Text(self.draft_detail.month)
                        Text("月")
                        Text(self.draft_detail.day)
                        Text("日")
                    }
                    .foregroundColor(Color.blue)
                }
                .onTapGesture{
                    self.tbd_month = self.draft_detail.month
                    self.tbd_day = self.draft_detail.day
                    self.DatePickerVisible.toggle()
                }
                
                if DatePickerVisible{
                    VStack{
                        HStack{
                            Spacer()
                            Text("完了")
                                .foregroundColor(Color.blue)
                                .onTapGesture{
                                    self.draft_detail.month = self.tbd_month
                                    self.draft_detail.day = self.tbd_day
                                    self.DatePickerVisible.toggle()
                                }
                        }
                        HStack{
                            Picker("日付", selection: $tbd_month){
                                ForEach(0..<Months.count){item in
                                    Text(String(self.Months[item])).tag(String(item+1))
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .compositingGroup()
                            .frame(width: 100)
                            .clipped()
                            Text("月")
                            Picker("日付", selection: $tbd_day){
                                ForEach(0..<Days.count){item in
                                    Text(String(self.Days[item])).tag(String(item+1))
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .compositingGroup()
                            .frame(width: 100)
                            .clipped()
                            Text("日")
                        }
                    }
                    .background(Color("light"))
                    .padding(.top, 10)
                }
                
                Section(header: Text("場所")){
                    HStack{
                        TextField(self.draft_detail.location, text:$draft_detail.location)
                            .foregroundColor(Color.blue)
                    }
                }
                Section(header: Text("滞在時間")){
                    HStack{
                        TextField(self.draft_detail.time_h, text:$draft_detail.time_h)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.blue)
                        Text("時間")
                        TextField(self.draft_detail.time_m, text:$draft_detail.time_m)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.blue)
                        Text("分")
                    }
                }
            }.listRowBackground(Color("base"))
    }
}
