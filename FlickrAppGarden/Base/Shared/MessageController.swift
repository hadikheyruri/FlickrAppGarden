//
//  MessageController.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

final class MessageController: UIAlertController {
    
    // MARK: - Public Methods

    public let connectionFailController: UIAlertController = {
        
        let alert = UIAlertController(title: "No connection", message: "Please check your internet connection.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        return alert
    }()
}

