//
//  FavoriteView.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/03.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorite.items) { item in
                    ItemRow(item: item)
                }
            }
            .navigationTitle("Favorite")
            .listStyle(.grouped)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(Favorite())
    }
}
