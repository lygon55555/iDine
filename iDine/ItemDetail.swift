//
//  ItemDetail.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/02.
//

import SwiftUI

struct ItemDetail: View {
    
    // @EnvironmentObject property wrapper allows this variable not to have a value in code,
    // because we're saying it will already be set in the environment.
    // When this view is shown, SwiftUI will automatically look in its list of environment objects for something that is of type Order, and attach it to that property.
    // If no Order object can be found then we have a problem -> crash (just like an implicitly unwrapped optional)
    // @EnvironmentObject is a property wrapper giving the automatic attachment ability,
    // also telling SwiftUI to watch the object for any changes and refresh its UI when a change announcement comes through.
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                // swapping the order of the padding() and background() modifiers has different results
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Favorite") {
                favorite.addOrRemove(item: item)
            }
        }
    }
}

// in the Xcode preview, we aren't launched from the app.
// This preview code will only get built when we're in debug mode - when we're building from Xcode
// This means it's safe to put code in there that only relates to our previews,
// which in this case will be a temporary Order instance.
struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}
