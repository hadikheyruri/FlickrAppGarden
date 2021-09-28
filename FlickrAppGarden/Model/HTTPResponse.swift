//
//  HTTPResponse.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import Foundation

struct HTTPResponse: Decodable {
    
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [Image]
}
