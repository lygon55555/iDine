//
//  CheckoutView.swift
//  iDine
//
//  Created by Yonghyun on 2022/03/02.
//

import SwiftUI

struct CheckoutView: View {
    
    // Rather than us asking to watch changes by hand, we instead bind our picker to a property on our struct, so that when the picker changes SwiftUI automatically changes the property too. And, just like environment objects, this will cause SwiftUI to re-invoke our body property so any changes are visible.
    
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    // @State works similarly to @EnvironmentObject in that if the object changes it automatically refreshed our UI,
    // but it's designed for simple local values like integers and strings.
    
    // If you want to use simple values that are used only by the current view you should use @State for your property wrapper. Apple also recommends you mark those properties as private to reiterate that they aren’t designed for external access.
    
    @State private var paymentType: String = "Cash"
    
    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
