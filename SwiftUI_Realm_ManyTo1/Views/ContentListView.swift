//
//  ContentListView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/02.
//

import SwiftUI

struct ContentListView: View {
  @EnvironmentObject var store: ItemStore
  
  // categoryTitleを渡すのは後でやろう。Item型にするのかな
//  @Binding var categoryTitle: String
  @State var contentTitle = ""
  @State var contentTitles = ["Content1", "Content2", "Content3"]
  
  var body: some View {
    List {
      // Section名が大文字になる。
      Section(header: Text("セクション名：　後で表示設定")) {
        HStack {
          TextField("コンテンツ名を入力してください。", text: $contentTitle)
          Button("決定", action: {
            contentTitles.append(contentTitle)
          })
        }
        ForEach(contentTitles, id: \.self) { rowName in
          Text(rowName)
        }
        .onDelete{ offsets in
          self.contentTitles.remove(atOffsets: offsets)
        }
      }
      
    }
  }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
      ContentListView()
//      ContentListView(categoryTitle: .constant("test category"))
    }
}
