//
//  ItemStore.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import RealmSwift

final class ItemStore: ObservableObject {
  
  private var categoriesResults: Results<CategoryDB>
  private var contentsResults: Results<ContentDB>
//  private var filteredContentsResults: Results<ContentDB>
  
  init(realm: Realm) {
    categoriesResults = realm.objects(CategoryDB.self)
    contentsResults = realm.objects(ContentDB.self)
  }
  
  var categories: [CategoryItem] {
    categoriesResults.map(CategoryItem.init)
  }
  
  var contents: [ContentItem] {
    contentsResults.map(ContentItem.init)
  }
  
  var c1 = { () -> () in print("Hello")}
  
//  なんかうまくいきそうな発想
//  だけど今は眠くて考えらんない。からまた今度で。
  var c3 = { (categoryID: Int) -> [ContentItem] in
    let contentIdArray: [Int]
    let contentTitleArray: [String]
    var contentItem = [ContentItem]()
    
    do {
      let realm = try Realm()
      let results = realm.objects(CategoryDB.self).filter("id = %@", categoryID)
      
      contentIdArray = results[0].contentDB.map { $0.id }
      contentTitleArray = results[0].contentDB.map { $0.contentTitle }
      for i in 0..<contentIdArray.count {
        contentItem.append(ContentItem(id: contentIdArray[i], contentTitle: contentTitleArray[i]))
      }
    } catch let error {
      print(error.localizedDescription)
    }
    return contentItem
  }
  
  
  
//  var filteredContents: [ContentItem] {
//    contentsResults.filter("id = %@").map(ContentItem.init)
//  }
//  let results = realm.objects(CategoryDB.self).filter("id = %@", categoryID)
//  contentArray = results[0].contentDB.map { $0.contentTitle }
}


extension ItemStore {
  func createCategory(categoryTitle: String) {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
//      やっていることは下と一緒
//      let dictionary: [String : Any] =
//        ["id": UUID().hashValue,
//         "categoryTitle": categoryTitle]
//      let categoryDB = CategoryDB(value: dictionary)
      
      let categoryDB = CategoryDB()
      categoryDB.id = UUID().hashValue
      categoryDB.categoryTitle = categoryTitle
      
      try realm.write {
        realm.add(categoryDB)
      }
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func createContent(categoryID: Int, contentTitle: String) {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      let results = realm.objects(CategoryDB.self).filter("id = %@", categoryID)
      
      let contentDB = ContentDB()
      contentDB.id = UUID().hashValue
      contentDB.contentTitle = contentTitle
      
      try realm.write {
        for category in results {
            category.contentDB.append(contentDB)
        }
      }
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func updateContent(contentID: Int, contentTitle: String) {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      try realm.write {
        realm.create(ContentDB.self, value: [
                      "id": contentID,
                      "contentTitle": contentTitle],
                     update: .modified)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  // 多分これエラーる。エラーらなくても、対応するcontentだけ残っちゃうはず
  func deleteCategory(categoryID: Int) {
    objectWillChange.send()
    
    guard let categoryDB = categoriesResults.first(where: { $0.id == categoryID })
    else {
      return
    }
    
    do {
      let realm = try Realm()
      try realm.write {
        realm.delete(categoryDB)
      }
    } catch let erorr {
      print(erorr.localizedDescription)
    }
    
  }
  
  func deleteContent(contentID: Int) {
    objectWillChange.send()
    
    guard let contentDB = contentsResults.first(where: { $0.id == contentID })
    else {
      return
    }
    
    do {
      let realm = try Realm()
      try realm.write {
        realm.delete(contentDB)
      }
    } catch let erorr {
      print(erorr.localizedDescription)
    }
  }
  

  func deleteFilteredContents(filteredContent: [ContentItem]) {
    objectWillChange.send()
    
    for content in filteredContent {
      guard let contentDB = contentsResults.first(where: { $0.id == content.id })
      else {
        return
      }
      
      do {
        let realm = try Realm()
        try realm.write {
          realm.delete(contentDB)
        }
      } catch let error {
        print(error.localizedDescription)
      }
    }
  }
  
//  コンテンツを一度でも追加するとエラーになる
  func deleteAll() {
    objectWillChange.send()
    
    do {
      let realm = try Realm()
      try realm.write {
        realm.deleteAll()
//        realm.delete(contentsResults)
//        realm.delete(categoriesResults)
      }
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
//  やっぱこいつ[ContentItem]を返したいな
//  返せた！？返せたよ！いけるのかこれで。。大体これでまた詰まる。
//  けど乗り越えるんだ。
  func filteredContent(categoryID: Int) -> [ContentItem] {

    let contentIdArray: [Int]
    let contentTitleArray: [String]
    var contentItem = [ContentItem]()
    
    do {
      let realm = try Realm()
      let results = realm.objects(CategoryDB.self).filter("id = %@", categoryID)
      
      contentIdArray = results[0].contentDB.map { $0.id }
      contentTitleArray = results[0].contentDB.map { $0.contentTitle }
      for i in 0..<contentIdArray.count {
        contentItem.append(ContentItem(id: contentIdArray[i], contentTitle: contentTitleArray[i]))
      }
    } catch let error {
      print(error.localizedDescription)
    }
    return contentItem
  }
  
  func printCategoriesResults() {
    print(categoriesResults)
  }
  
  func printContentsResults() {
    print(contentsResults)
  }
  
}
