//
//  Favorite.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/03.
//

import SwiftUI

class Favorite: ObservableObject {
    @Published var items = [MenuItem]()

    func addOrRemove(item: MenuItem) {
        if !items.contains(item) {
            items.append(item)
        } else {
            remove(item: item)
        }
    }

    private func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
