//
//  UserData.swift
//  LocationList
//
//  Created by Matsui Maki on 2021/12/21.
//

import SwiftUI
import Combine  //値を監視して仕分けや型の変更を行えるフレームワーク

struct Timeline{
    var id: Int = 0
    var month: String = ""
    var day: String = ""
    var location: String = ""
    var time_h: String = ""
    var time_m: String = ""
    
    init(id: Int, month: String, day: String, location: String, time_h: String, time_m: String){
        self.id = id
        self.month = month
        self.day = day
        self.location = location
        self.time_h = time_h
        self.time_m = time_m
    }
}

final class UserData: ObservableObject  {
    @Published var timelines: [Timeline] = [
        Timeline(id:0, month: "10",day: "1", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:1, month: "10",day: "5", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:2, month: "10",day: "6", location: "ライカム", time_h:"5", time_m: "24"),
        Timeline(id:3, month: "10",day: "7", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:4, month: "10",day: "9", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:5, month: "10",day: "10", location: "ライカム", time_h:"5", time_m: "24"),
        Timeline(id:6, month: "10",day: "11", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:7, month: "10",day: "15", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:8, month: "10",day: "23", location: "ライカム", time_h:"5", time_m: "24"),
        Timeline(id:9, month: "10",day: "25", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:10, month: "10",day: "30", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:11, month: "10",day: "31", location: "ライカム", time_h:"5", time_m: "24"),
        Timeline(id:12, month: "10",day: "1", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:13, month: "10",day: "5", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:14, month: "10",day: "6", location: "ライカム", time_h:"5", time_m: "24"),
        Timeline(id:15, month: "10",day: "7", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:16, month: "10",day: "9", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:17, month: "10",day: "10", location: "ライカム", time_h:"5", time_m: "24"),
        Timeline(id:18, month: "10",day: "11", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:19, month: "10",day: "15", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:20, month: "10",day: "23", location: "ライカム", time_h:"5", time_m: "24"),
        Timeline(id:21, month: "10",day: "25", location: "大学", time_h:"2", time_m: "01"),
        Timeline(id:22, month: "10",day: "30", location: "バイト", time_h:"6",time_m: "23"),
        Timeline(id:23, month: "10",day: "31", location: "ライカム", time_h:"5", time_m: "24")
    ]
}
