//
//  FetchData.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import Foundation

final class FetchData {
    
    static let shared = FetchData()
    private init() { }
        
    func fetchImageData(for tags: String?, handler: NetworkHandler?, completion: @escaping (Result<[Image], Error>) -> Swift.Void) {

        let validatedTags: String = Validator.validateSearch(tags)
        
        handler?.queryImages(for: validatedTags, completion: { (res) in
            
            switch res {
            case .success(let results):
                completion(.success(results))
            case .failure(let err):
                completion(.failure(err))
            }
        })
    }
}
