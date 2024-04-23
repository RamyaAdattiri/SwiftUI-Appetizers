//
//  EmptyState.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2024-03-06.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let messgae: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(messgae)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
       
    }
}

#Preview {
    EmptyState(imageName: "empty-order", messgae: "This is a text message. \n A lil long for testing")
}
