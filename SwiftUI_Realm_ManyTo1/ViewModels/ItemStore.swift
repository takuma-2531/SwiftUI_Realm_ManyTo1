//
//  ItemStore.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import RealmSwift

final class ItemStore: ObservableObject {
  
  private var itemResults: Results<CategoryDB>
  
  init(realm: Realm) {
    itemResults = realm.objects(CategoryDB.self)
  }
  
  var items: [Item] {
    itemResults.map(Item.init)
  }
  
}

extension ItemStore {
  func createCategory(categoryTitle: String) {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      
      let dictionary: [String : Any] =
        ["categoryTitle": "夏休みの宿題",
         "contentDB" : [["contentTitle": "算数"],
                        ["contentTitle": "英語"],
                        ["contentTitle": "社会"]]
        ]
      
      let categoryDB = CategoryDB(value: dictionary)
      
//      let categoryDB = CategoryDB()
//      categoryDB.id = UUID().hashValue
//      categoryDB.categoryTitle = categoryTitle
      
      try realm.write {
        realm.add(categoryDB)
      }
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func createContent(contentTitle: String) {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      let results = realm.objects(CategoryDB.self)
      
      let contentDB = ContentDB(value: ["contentTitle": contentTitle])
      
      try realm.write {
        for category in results {
          category.contentDB.append(contentDB)
        }
      }
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  
  
  // 以下テスト、TestViewを使って願う動きをすることを確認した。
  // https://qiita.com/reiji_matsumura/items/df430d228577c041d61d
  func createTest() {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      
      let dictionary: [String : Any] =
        ["id": UUID().hashValue,
         "categoryTitle": "夏休みの宿題",
         "contentDB" : [["contentTitle" : "算数"],
                        ["contentTitle" : "英語"],
                        ["contentTitle" : "社会"]]
         // ここを空にすれば、カテゴリーだけ追加できる。
         // むしろこれなくてもOKなんかな？調査調査
        ]
      
      let categoryDB = CategoryDB(value: dictionary)
      
      try realm.write {
        realm.add(categoryDB)
        print("一つだけ")
        print(categoryDB)
      }
      print("全部出力")
      print(itemResults)
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func contentCreateTest() {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      let results = realm.objects(CategoryDB.self)
      
      // 追加する項目名を引数で持ってくる。
      let contentDB = ContentDB(value: ["contentTitle": "追加追加！"])
      
      try realm.write {
        
        for category in results {
          // idの部分を引数で持って来れればOK
          if category.id == 1597100878461059076 {
            category.contentDB.append(contentDB)
          }
        }
      }
      print("追加後", results)
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func arrayPrint() {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      let results = realm.objects(CategoryDB.self)
      
      var categoryDBArray = ["id": 0,
                             "categoryTitle": "",
                             "contentDB": []] as [String : Any]
      var contentDBArray: Array<String> = []
      
      for category in results {
        categoryDBArray["id"] = category["id"]
        categoryDBArray["categoryTitle"] = category["categoryTitle"]
        for content in category["contentDB"] as! List<ContentDB> {
          contentDBArray.append(content.contentTitle)
        }
      }
      categoryDBArray["contentDB"] = contentDBArray
      print(categoryDBArray)
      print(contentDBArray)
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func printItems() {
    print(items)
  }
}
