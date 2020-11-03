//
//  ContentListView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import SwiftUI

struct ContentListView: View {
  @EnvironmentObject var store: ItemStore
  let category: Categories
  let contents: [Contents]
  
  
  
  var contentArray: [String] {
    store.contentArrayEnter(categoryID: category.id)
  }
  
  
  
  @State var contentTitle = ""
  
  var body: some View {
    List {
      Section(header: Text("コンテンツ一覧")) {
        HStack {
          TextField("コンテンツ名を入力してください。", text: $contentTitle)
          Button("決定", action: {
            store.createContent(
              categoryID: category.id ,
              contentTitle: contentTitle)
            contentTitle = ""
          })
        }
        ForEach(contentArray, id: \.self) { content in
          Text(content)
        }
      }
      
    }
    .navigationTitle(Text(category.categoryTitle))
  }
  
  
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
      ContentListView(category: ItemMock.category1,
                      contents: ItemMock.contentMock)
    }
}
