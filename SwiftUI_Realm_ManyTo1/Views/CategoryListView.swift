//
//  CategoryListView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import SwiftUI

struct CategoryListView: View {
  @EnvironmentObject var store: ItemStore
  let items: [Item]
  
  @State var categoryTitle = ""
  @State var categoryTitles = ["Category1", "Category2", "Category3"]
  
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("test")) {
          HStack {
            TextField("カテゴリ名を入力してください。", text: $categoryTitle)
            Button("決定", action: {
//              categoryTitles.append(categoryTitle)
              store.createCategory(categoryTitle: categoryTitle)
            })
          }
          ForEach(items) { item in
            NavigationLink(destination: ContentListView()) {
              Text(String(item.id))
            }
          }
          
          
//          ForEach(0..<categoryTitles.count, id: \.self) { i in
//            NavigationLink(destination: ContentListView(categoryTitle: $categoryTitles[i])) {
//              Text(categoryTitles[i])
//            }
//          }
          // .onDeleteは使えないのか。使う検討してた英語記事あったな。読むか。
          // 英語の記事じゃなくて、英語の翻訳記事で日本語ちょいおかしめのやつ。
          // https://python5.com/q/rgjtynja
//          .onDelete { offsets in
//            self.categoryTitles.remove(atOffsets: offsets)
//          }
        }
        
      }
    }
    
  }
}

struct CategoryListView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryListView(items: ItemMock.itemMock)
  }
}
