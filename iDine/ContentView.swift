//
//  ContentView.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/02.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
//        Text("Hello, world!")
//            .padding()  // padding() is a modifier.
//                        // It modifies how the text view looks or acts.
        
//        // static list view
//        // sending in three pieces of fixed data, so it interprets them as three rows in the table.
//        List {
//            Text("Hello World")
//            Text("Hello World")
//            Text("Hello World")
//        }
        
//        NavigationView {
//            List {
//                Text("Hello World")
//                Text("Hello World")
//                Text("Hello World")
//            }
//            .navigationTitle("Menu")
//            // navigationTitle() modifier is attached to the list rather than the navigation view
//            // think of how we'd set the title of a UIViewController
//            // rather than try to set the title of a UINavigationController
//        }
        
        // dynamic List
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
