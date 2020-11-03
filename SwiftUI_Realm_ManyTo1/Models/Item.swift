//
//  Item.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import Foundation
import RealmSwift


struct Item: Identifiable {
  let id: Int
//  let titles: [String : Any]
  
  let categoryTitle: String
  let contentTitles: [String]
//  let contentTitles: List<ContentDB>
  
  
}
extension Item {
  init(categoryDB: CategoryDB) {
    id = categoryDB.id
    categoryTitle = categoryDB.categoryTitle
    contentTitles = ["サンプル", "ここどうする？", "悩むね"]
    
//    do {
//      let realm = try Realm()
//      let results = realm.objects(ContentDB.self)
//      
//      var categoryDBArray = ["id": 0,
//                             "categoryTitle": "",
//                             "contentDB": []] as [String : Any]
//      var contentDBArray: Array<String> = []
//      
//      for category in results {
//        categoryDBArray["id"] = category["id"]
//        categoryDBArray["categoryTitle"] = category["categoryTitle"]
//        for content in category["contentDB"] as! List<ContentDB> {
//          contentDBArray.append(content.contentTitle)
//        }
//      }
//      categoryDBArray["contentDB"] = contentDBArray
//      print(categoryDBArray)
//      print(contentDBArray)
//    } catch let error {
//      print(error.localizedDescription)
//    }
    
    
    
    
    // これは辞書？
//    titles = ["id": UUID().hashValue,
//              "categoryTitle" : categoryDB.categoryTitle,
//              "contentDB" : categoryDB.contentDB]
//    print("Itemをプリントしてるやつ：\(categoryDB.contentDB)")
    // contentTitleのcontentDBって書き方あっているのか？
    // あってそう
    
  }
}
