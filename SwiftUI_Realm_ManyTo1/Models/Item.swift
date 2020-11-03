//
//  Item.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import Foundation
import RealmSwift


struct Categories: Identifiable {
  let id: Int
  let categoryTitle: String
  
}
extension Categories {
  init(categoryDB: CategoryDB) {
    id = categoryDB.id
    categoryTitle = categoryDB.categoryTitle
    
  }
}

struct Contents: Identifiable {
  let id: Int
  let contentTitle: String
//  let categoryId: Int
  
}

extension Contents {
  init(contentDB: ContentDB) {
    id = contentDB.id
    contentTitle = contentDB.contentTitle
    
  }
}
