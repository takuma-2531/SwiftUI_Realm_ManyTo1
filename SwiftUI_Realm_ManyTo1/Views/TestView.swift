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
  let items: [Item]
  
  var body: some View {
    VStack {
      Button("テスト", action: store.createTest)
      Button("追加", action: store.contentCreateTest)
      Button("プリント", action: {
        print(items)
      })
      Button("配列のプリント", action: store.arrayPrint)
      Button("itemsのプリント", action: store.printItems)
      List {
        ForEach(items) { item in
//          Text(String(item.id))
          Text(item.categoryTitle)
          Text(item.contentTitles[0])
          Text(item.contentTitles[1])
        }
      }
    }
  }
}

struct TestView_Previews: PreviewProvider {
  static var previews: some View {
    TestView(items: ItemMock.itemMock)
  }
}
