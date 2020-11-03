//
//  CategoryListView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import SwiftUI

struct CategoryListView: View {
  @EnvironmentObject var store: ItemStore
  let categories: [Categories]
  
  @State var categoryTitle = ""
  @State var categoryTitles = ["Category1", "Category2", "Category3"]
  
  var body: some View {
    NavigationView {
      List {
        Section(header: Text("カテゴリー一覧")) {
          HStack {
            TextField("カテゴリー名を入力してください。", text: $categoryTitle)
            Button("決定", action: {
              store.createCategory(categoryTitle: categoryTitle)
              categoryTitle = ""
            })
            Text("全削除")
              .onTapGesture {store.deleteAll()}
          }
          ForEach(categories) { category in
            NavigationLink(
              destination:
                ContentListView(category: category ,
                                contents: store.contents)) {
              Text(String(category.categoryTitle))
            }
          }
          
        }
        
      }
      .navigationTitle(Text("Realm"))
    }
    
  }
}

struct CategoryListView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryListView(categories: ItemMock.categoryMock)
  }
}
