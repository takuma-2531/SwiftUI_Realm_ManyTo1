//
//  EditTitle.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/11/08.
//

import Foundation

class ContentForm: ObservableObject {

  @Published var title = ""
  @Published var contentID = 0
//  これの場合下の表現じゃなくて上の表現でよいのでは？
//  var contentID: Int?
//  idもう一個いる？ CategoryID
  
//  init() {}
  
  init(_ content: ContentItem) {
    title = content.contentTitle
    contentID = content.id
  }
  
}
