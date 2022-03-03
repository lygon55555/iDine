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
    
    let paymentTypes: [String] = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts: [Int] = [10, 15, 20, 25, 0]
    let pickupTimes: [String] = ["Now", "Tonight", "Tomorrow Morning"]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    // @State works similarly to @EnvironmentObject in that if the object changes it automatically refreshed our UI,
    // but it's designed for simple local values like integers and strings.
    
    // If you want to use simple values that are used only by the current view you should use @State for your property wrapper. Apple also recommends you mark those properties as private to reiterate that they aren’t designed for external access.
    
    @State private var paymentType: String = "Cash"
    @State private var addLoyaltyDetails: Bool = false
    @State private var loyaltyNumber: String = ""
    @State private var tipAmount: Int = 20
    @State private var showingPaymentAlert: Bool = false
    @State private var pickupTime: String = "Now"
    
    var body: some View {
        Form {
            Section {
                // $ - two-way binding
                // because any changes to the value of paymentType will update the picker, and any changes to the picker will update paymentType.
                // This is where the dollar sign comes in: Swift property wrappers use that to provide two-way bindings to their data, so when we say $paymentType SwiftUI will write the value using the property wrapper, which will in turn stash it away and cause the UI to refresh automatically.
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                
                
                // When any @State or @EnvironmentObject changes its value, SwiftUI will re-invoke the body property.
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                
                Picker("Pickup time:", selection: $pickupTime) {
                    ForEach(pickupTimes, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section(header:
                        Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"),
                  message: Text("Your total was \(totalPrice) - thank you!"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
