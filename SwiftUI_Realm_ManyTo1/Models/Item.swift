//
//  Item.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import Foundation
import RealmSwift

// Categoryと単数系にしたいが、予約ごとかぶってエラーになるから複数形
struct CategoryItem: Identifiable {
  let id: Int
  let categoryTitle: String
  
}
extension CategoryItem {
  init(categoryDB: CategoryDB) {
    id = categoryDB.id
    categoryTitle = categoryDB.categoryTitle
    
  }
}

struct ContentItem: Identifiable {
  let id: Int
  let contentTitle: String
//  let categoryId: Int
  
}

extension ContentItem {
  init(contentDB: ContentDB) {
    id = contentDB.id
    contentTitle = contentDB.contentTitle
    
  }
}
