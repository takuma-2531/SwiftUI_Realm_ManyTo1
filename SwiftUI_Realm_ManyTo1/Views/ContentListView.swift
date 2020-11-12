//
//  ContentListView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import SwiftUI

struct ContentListView: View {
  @EnvironmentObject var store: ItemStore
  @Environment(\.presentationMode) var presentationMode
  let category: CategoryItem
//  filteredContentsにリネームするか
//  でも謎Warningでるようになった。
//  でもdeleteAllはエラー出なくなった
  let contents: [ContentItem]
  
//  これいらんくなったな
//  var filteredContent: [ContentItem] {
//    store.filteredContent(categoryID: category.id)
//  }
  
  @State var contentTitle = ""
  
//MARK:-
  var body: some View {
    List {
      Section(header: headerView) {
        enterContentNameRow
        categoryListView
      }
      
    }
    .navigationTitle(Text(category.categoryTitle))
    .navigationBarItems(trailing: trailingNavigationBarItemView)
  }
  
  var trailingNavigationBarItemView: some View {
    Button("カテゴリー削除になるボタン", action: deleteCategory)
  }
  
  var headerView: some View {
    HStack {
      Text("コンテンツ一覧")
      Spacer()
      Button("コンテンツ全削除", action: deleteFilteredContents)
    }
    
  }
  
  var enterContentNameRow: some View {
    HStack {
      TextField("コンテンツ名を入力してください。", text: $contentTitle)
      Text("決定")
        .onTapGesture {
          store.createContent(categoryID: category.id ,
                              contentTitle: contentTitle)
          contentTitle = ""
        }
    }
  }
  
  var categoryListView: some View {
    ForEach(contents) { content in
      ContentRowView(content: content)
    }
  }
  
}

extension ContentListView {
  func dismiss() {
    presentationMode.wrappedValue.dismiss()
  }
  
  func deleteCategory() {
//    store.deleteAllContent()
//    store.deleteCategory(categoryID: category.id)
    dismiss()

  }
  
  func deleteFilteredContents() {
//    store.deleteFilteredContents(filteredContent: filteredContent)
    store.deleteAll()
  }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
      ContentListView(category: ItemMock.category1,
                      contents: ItemMock.contentMock)
    }
}
