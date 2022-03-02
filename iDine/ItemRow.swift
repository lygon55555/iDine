//
//  ItemRow.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/02.
//

import SwiftUI

struct ItemRow: View {
    
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
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
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2)) // 2-point gray border
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            
            Spacer()    // automatically take up all available free space
            
            // we can put arrays into a ForEach as long as SwiftUI knows
            // how to identify each items conform to the Identifiable protocol,
            // which uses the id property to identify items
            
            // we have an array of strings here but we can't make them conform to Identifiable.
            // Instead, we need to tell Swift that the string itself is the identifiable for each item.
            // This can be done using the id parameter for ForEach, passing in \.self as its only parameter
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
