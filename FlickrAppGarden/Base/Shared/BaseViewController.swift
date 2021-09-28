//
//  BaseViewController.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Controller LifeCylce

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Color.black
        self.overrideUserInterfaceStyle = .dark
    }
}
