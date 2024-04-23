//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Ramya Adattiri on 2024-02-08.
//

import SwiftUI

final class ImageLoader : ObservableObject {
   
    @Published var image : Image? = nil
    
    func load(fromUURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}


struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString : String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{ imageLoader.load(fromUURLString: urlString)}
    }
}
