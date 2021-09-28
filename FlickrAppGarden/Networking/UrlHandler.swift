//
//  UrlHandler.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import Foundation

enum API {
    
    static let baseUrl: String = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
}

struct ImagesRequest {
    
    func requestUrl(with tags: String) -> URL {
        
        let queryString: String =  "&tags=" + tags
        let urlString: String = API.baseUrl + queryString
        
        guard let url = URL(string: urlString) else { fatalError("Faulty fetch image url.") }

        return url
    }
}
