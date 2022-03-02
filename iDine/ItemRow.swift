//
//  ItemRow.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/02.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    
//    // some View means we must return one specific view from our method
//    var body: some View {
//        Image(item.thumbnailImage)
//        Text(item.name)
//        // return two different views
//        // Swift automatically wraps them up in a single, hidden container called a tuple view,
//        // but without any further instructions on how to display this SwiftUI just picks the first view
//    }
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
