//
//  Image.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import Foundation

/**
 * Image Model
 */
struct Image: Decodable {
    
    let title: String
    let link: String
    let media: Media
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorId: String
    let tags: String
    
    enum CodingKeys: String, CodingKey {
                
        typealias RawValue = String
    
        case dateTaken = "date_taken"
        case authorId = "author_id"
        case title, link, media, description, published, author, tags
    }
}

struct Media: Decodable {
    let m: String
}
