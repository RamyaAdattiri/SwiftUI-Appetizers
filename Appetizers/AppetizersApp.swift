//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2023-11-29.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
