//
//  OrderView.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2023-11-29.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List() {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }.listStyle(PlainListStyle())
                    Spacer()
                    Button {
                        print("Order placed!")
                    }label: {
                        Text("$\(order.totalPrice, specifier: "%.2f")- Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom,25)
                }
                if(order.items.isEmpty) {
                    EmptyState(imageName: "empty-order",
                               messgae: "You have no items in your order. Please add your appetizers")
                }
            }
            .navigationTitle("🧾 Orders")
            
        }
    }
    
  
}

#Preview {
    OrderView()
}
