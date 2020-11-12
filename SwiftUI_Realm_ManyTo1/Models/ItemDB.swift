//
//  ItemDB.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import RealmSwift

class CategoryDB: Object {
  @objc dynamic var id = 0
  @objc dynamic var categoryTitle = ""
  let contentDB = List<ContentDB>()
  
  override class func primaryKey() -> String? {
    "id"
  }
}

class ContentDB: Object {
  @objc dynamic var id = 0
  @objc dynamic var contentTitle = ""
  
  override class func primaryKey() -> String? {
    "id"
  }
}
