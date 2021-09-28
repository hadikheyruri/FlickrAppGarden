//
//  Validator.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-28.
//

import Foundation

fileprivate enum defaults {
    static public let searchTag: String = "lazy"
}

class Validator {
    
    // The following validator is specifically for flickr services API
    static func validateSearch(_ tags: String?) -> String {
    
        guard let tags = tags else { return defaults.searchTag }

        let trimmed: String = tags.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return defaults.searchTag }
        
        let searchTags: String = trimmed.replacingOccurrences(of: " ", with: ",")
        
        return searchTags
    }
}


