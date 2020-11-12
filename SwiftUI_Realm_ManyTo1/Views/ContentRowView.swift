//
//  ContentRowView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/08.
//

import SwiftUI

struct ContentRowView: View {
  
  @EnvironmentObject var store: ItemStore
  let content: ContentItem

  @State var contentFormIsPresented = false
  
  var body: some View {
    HStack {
      Text(content.contentTitle)
            .onTapGesture {
              contentFormIsPresented.toggle()
            }
            .sheet(isPresented: $contentFormIsPresented) {
              ContentFormView(form: ContentForm(content))
            }
      Spacer()
      Image(systemName: "trash.circle.fill")
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundColor(.red)
        .onTapGesture {
          store.deleteContent(contentID: content.id)
        }
    }
    
  }
}

struct ContentRowView_Previews: PreviewProvider {
  static var previews: some View {
    ContentRowView(content: ContentItem(id: 1, contentTitle: "title"))
  }
}
