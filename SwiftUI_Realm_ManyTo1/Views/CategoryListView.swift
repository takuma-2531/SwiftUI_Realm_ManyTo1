//
//  CategoryListView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import SwiftUI

struct CategoryListView: View {
  @EnvironmentObject var store: ItemStore
  let categories: [CategoryItem]
  
  @State var categoryTitle = ""
  
  var body: some View {
    NavigationView {
      List {
        Section(header: headerView) {
          enterCategoryNameRow
          categoriesListView
          Button("カテゴリープリント", action: {
            store.printCategoriesResults()
          })
          Button("コンテンツプリント", action: {
            store.printContentsResults()
          })
        }
      }
      .navigationTitle(Text("Realm"))
    }
  }
  
  var headerView: some View {
    HStack {
      Text("カテゴリー一覧")
      Spacer()
      Text("全削除").onTapGesture { store.deleteAll()}
    }
  }
  
  var enterCategoryNameRow: some View {
    HStack{
      TextField("カテゴリー名を入力してください。", text: $categoryTitle)
      Text("決定")
        .onTapGesture {
          store.createCategory(categoryTitle: categoryTitle)
          categoryTitle = ""
        }
    }
  }
  
  var categoriesListView: some View {
    ForEach(categories) { category in
      NavigationLink(
        destination: ContentListView(category: category ,
                                     contents: store.filteredContent(categoryID: category.id))) {
        HStack {
          Text(String(category.categoryTitle))
          Spacer()
          Image(systemName: "trash.circle.fill")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(.red)
            .onTapGesture {
//              store.deleteCategory(categoryID: category.id)
            }
        }
        
      }
    }
  }
}

struct CategoryListView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryListView(categories: ItemMock.categoryMock)
  }
}
