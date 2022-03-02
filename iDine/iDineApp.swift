//
//  iDineApp.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/02.
//

import SwiftUI

@main
struct iDineApp: App {
    
    // In this app, we’re going to create an instance of our order when the app launches, then pass it into our content view. Any view that is inside that content view – anything that can call the content view its ancestor – will automatically gain access to that environment object. Even better, when any view changes it, all other places automatically update.
    
    // creates a new order when the app starts, and keeps it alive regardless of what view we show.
    // @StateObject property wrapper is responsible for keeping the object alive throughout the life of our app
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
    
    // In the background, any view that relies on an environment object will be refreshed when it announces changes. In practice that means SwiftUI will re-invoke the body property, which in turn means everything inside body will read the latest values from the environment.
}
