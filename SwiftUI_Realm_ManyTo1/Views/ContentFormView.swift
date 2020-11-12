//
//  EditNameView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/08.
//

import SwiftUI

struct ContentFormView: View {
  @EnvironmentObject var store: ItemStore
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var form: ContentForm
  
  var body: some View {
    VStack {
      TextField("編集する名前", text: $form.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
      HStack {
        Button("キャンセル", action: dismiss)
        Button("決定", action: updateContent)
      }
      .padding()
      Button("削除", action: deleteContent)
        .foregroundColor(.red)
        
    }
    .padding()
  }
}

extension ContentFormView {
  func dismiss() {
    presentationMode.wrappedValue.dismiss()
  }
  
  func updateContent() {
    store.updateContent(contentID: form.contentID,
                        contentTitle: form.title)
    dismiss()
  }
  
  func deleteContent() {
    store.deleteContent(contentID: form.contentID)
    dismiss()
  }
}

//struct EditNameView_Previews: PreviewProvider {
//  static var previews: some View {
//    EditTitleView(form: <#ContentForm#>)
//  }
//}
