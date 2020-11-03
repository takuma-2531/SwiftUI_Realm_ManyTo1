//
//  ContentView.swift
//  SwiftUI_Realm_ManyTo1
//
//  Created by 小川卓馬 on 2020/10/31.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
  @EnvironmentObject var store: ItemStore
  
  var body: some View {
//    NavigationView {
      CategoryListView(categories: store.categories)

//    }
//    TestView(categories: store.categories)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
