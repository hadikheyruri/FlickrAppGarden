//
//  APIError.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import Foundation

enum APIError: Error {
    
    /// No data received from the server.
    case noData
    /// The server response was invalid (unexpected format).
    case invalidResponse
    /// The request was rejected: 400-499
    case badRequest(String?)
    /// Encoutered a server error.
    case serverError(String?)
    /// There was an error parsing the data.
    case parseError(String?)
    /// Invalid image data
    case invalidImageData(String?)
    /// No internet connect
    case noConnection
    /// Unknown error.
    case unknown
}
