//
//  ImageDisplayController.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

final class ImageDisplayController: BaseViewController {
    
    // MARK: - Properties

    public var image: Image?
    
    // MARK: - Controller LifeCyle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Color.semiClear
        
        if let image = self.image {
            let imageViewModel = ImageViewModel(image: image)
            let imageView: ImageDisplayView = ImageDisplayView(imageViewModel: imageViewModel)
            self.view.addSubview(imageView)
        }
    }
}
