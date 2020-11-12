//
//  ItemMock.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import Foundation
import RealmSwift

enum ItemMock {
  static let category1 = CategoryItem(id: 0, categoryTitle: "朝ごはん")
  static let category2 = CategoryItem(id: 1, categoryTitle: "昼ごはん")
  static let category3 = CategoryItem(id: 2, categoryTitle: "夜ごはん")
  
  static let categoryMock = [category1, category2, category3]
  
  
  static let content1 = ContentItem(id: 0, contentTitle: "カレー")
  static let content2 = ContentItem(id: 1, contentTitle: "そば")
  static let content3 = ContentItem(id: 2, contentTitle: "うどん")
  
  static let contentMock = [content1, content2, content3]

}
