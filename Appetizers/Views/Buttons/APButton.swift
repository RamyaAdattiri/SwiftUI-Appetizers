//
//  APButton.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2024-02-14.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260,height: 60)
            .foregroundColor(.white)
            .background(Color(.primaryBrand))
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Test Title")
}
