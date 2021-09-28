//
//  FlowCoordinator.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: FlowNavigationController { get }
    func load(animated: Bool)
}

final class FlowCoordinator: Coordinator {
    
    // MARK: - Properties

    public var navigationController: FlowNavigationController
    public var window: UIWindow?
    
    // TODO: this guy needs children! use case is for multiple flows.
    
    // MARK: - Initializer

    init(_ navigationController: FlowNavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
    }
    
    // MARK: - Load Method

    public func load(animated: Bool) {
        
        let initialCoordinator: ImageFlowCoordinator = ImageFlowCoordinator( self.navigationController)
        
        initialCoordinator.load(animated: true)
        
        self.window?.rootViewController = initialCoordinator.navigationController
        self.window?.makeKeyAndVisible()
    }
}
