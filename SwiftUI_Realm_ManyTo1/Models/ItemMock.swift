//
//  ItemMock.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import Foundation
import RealmSwift

enum ItemMock {

  static let row1 = Item(id: 0,
                         categoryTitle: "晩ご飯",
                         contentTitles: ["カレー", "親子丼", "豚しゃぶ"])
  
  static let row2 = Item(id: 1,
                         categoryTitle: "朝ご飯",
                         contentTitles: ["ヨーグルト", "シリアル"])
  
  static let row3 = Item(id: 3,
                         categoryTitle: "昼ご飯",
                         contentTitles: ["焼きそば", "牛丼", "なす", "ピザ"])

  
  
  static let itemMock = [
    row1, row2, row3
  ]
}
