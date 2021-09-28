//
//  ImageViewModel.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit
import Combine

/**
 * Image View Model
 */
class CellImageViewModel: ObservableObject {
    
    let imageUrl: URL?
    @Published var image: UIImage?
    
    init(image: Image, loader: ImageLoader?) {
        
        guard let url = URL(string: image.media.m) else {
            self.imageUrl =  nil
            self.image = nil
            return
        }

        self.imageUrl = url
            
        loader?.loadImage(url: url) { (respone) in
            if case .success(let image) = respone {
                self.image = image
            }
        }
    }
}
