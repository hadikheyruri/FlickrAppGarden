//
//  ImageLoader.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

final class ImageLoader {
    
    func loadImage(url: URL?, completion: @escaping (Result<UIImage, Error>) -> ()) {
            
        guard let url = url else { return }
            
        if let cachedImage = imageCache[url] {
            completion(.success(cachedImage))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in

            if let err = err {
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.noData))
                }
                return
            }
            
            guard let image: UIImage = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.invalidImageData("not valid imageurl: \(url)")))
                }
                return
            }
            
            imageCache[url] = image
            
            DispatchQueue.main.async {
                completion(.success(image))
            }
            
        }.resume()
    }
}
