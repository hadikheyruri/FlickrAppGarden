//
//  ImageFlowCoordinator.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

final class ImageFlowCoordinator: Coordinator {
    
    // MARK: - Properties
    
    public var navigationController: FlowNavigationController
    
    // MARK: - Public Methods

    public func load(animated: Bool) {
        let imageSelectionVC: ImageSelectionController = ImageSelectionController()
        imageSelectionVC.delegate = self
        self.navigationController.setViewControllers([imageSelectionVC], animated: true)
    }
    
    // MARK: - Initializer
    
    init(_ navigationController: FlowNavigationController = FlowNavigationController()) {
        self.navigationController = navigationController
    }
}

extension ImageFlowCoordinator: ImageSelectionControllerDelegate {
    
    public func didSelectImage(with image: Image?) {
        guard let image: Image = image else { return }
        let imageDisplayController: ImageDisplayController = ImageDisplayController()
        imageDisplayController.image = image
        self.navigationController.showDetailViewController(imageDisplayController, sender: self.navigationController)
    }
}
