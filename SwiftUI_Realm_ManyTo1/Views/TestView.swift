//
//  TestView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import SwiftUI
import RealmSwift

struct TestView: View {
  @EnvironmentObject var store: ItemStore
  let categories: [CategoryItem]
  
  var body: some View {
    VStack {
//      Button("テスト", action: store.createTest)
//      Button("追加", action: store.contentCreateTest)
      Button("プリント", action: {
        print(categories)
      })
//      Button("配列のプリント", action: store.arrayPrint)
      List {
        ForEach(categories) { item in
//          Text(String(item.id))
          Text(item.categoryTitle)
        }
      }
    }
  }
}

struct TestView_Previews: PreviewProvider {
  static var previews: some View {
    TestView(categories: ItemMock.categoryMock)
  }
}
