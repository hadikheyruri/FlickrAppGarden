//
//  NetworkHandler.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import Foundation

final class NetworkHandler {
    
    func queryImages(for tags: String, completion: @escaping (Result<[Image], Error>) -> ()) {

        let photoRequest = ImagesRequest()
        let url = photoRequest.requestUrl(with: tags)
        
        self.request(with: url) { (response) in

            switch response {
            case .success(let data):
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    
                    let json = try decoder.decode(HTTPResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(json.items))
                    }

                } catch let jsonError {
                    DispatchQueue.main.async {
                        completion(.failure(jsonError))
                    }
                }
            case .failure(let err):
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
            }
        }
    }
    
    func request(with url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        
        Connectivity.isReachable { status in

            if case .disconnected = status {
                completion(.failure(APIError.noConnection))
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, res, err) in

                if let err = err {
                    DispatchQueue.main.async {
                        completion(.failure(err))
                    }
                    return
                }
                guard let data = data else { return }
                DispatchQueue.main.async {
                    completion(.success(data))
                }
                
            }.resume()
        }
    }
}
