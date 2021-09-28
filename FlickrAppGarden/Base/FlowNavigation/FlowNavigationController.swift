//
//  FlowNavigationController.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

/**
 * Custom Navigation Controller
 */
final class FlowNavigationController: UINavigationController {
    
    // MARK: - Controller Lifecycle

    override func viewDidLoad() {
        self.configureNavigationBar()
    }
    
    // MARK: - Controller Configuartion
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func configureNavigationBar() {
        
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.backgroundColor = Color.clear
        self.navigationBar.isTranslucent = true
        self.navigationBar.barTintColor = Color.clear
        self.navigationBar.tintColor = Color.navigationTintColor

        self.navigationBar.largeTitleTextAttributes = [.foregroundColor: Color.yellow]
        self.navigationBar.titleTextAttributes = [.foregroundColor: Color.yellow]
    }
}
