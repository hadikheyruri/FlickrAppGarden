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
final class ImageViewModel: ObservableObject {
    
    // MARK: - Properties
    
    public let imageUrl: URL?
    @Published public var image: UIImage?
    
    // MARK: - Initializer

    init(image: Image) {
        
        guard let url = URL(string: image.media.m) else {
            self.imageUrl =  nil
            self.image = nil
            return
        }

        self.imageUrl = url
        
        var imageLoader: ImageLoader?
        imageLoader = ImageLoader()
        
        imageLoader?.loadImage(url: url) { (respone) in
            if case .success(let image) = respone {
                self.image = image
            }
        }
        
    }
}
