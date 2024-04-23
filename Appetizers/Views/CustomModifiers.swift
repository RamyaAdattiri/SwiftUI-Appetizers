//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2024-04-22.
//

import SwiftUI


struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

struct StandardImageStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}



extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
