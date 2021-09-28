//
//  ImageDisplayView.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//


import UIKit
import Combine

/**
 * Meme Image Table View Cell
 */
final class ImageDisplayView: UIView {
    
    // MARK: - Properties
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - View Elements
    
    private let placeholderImage: UIImage = {
        let image: UIImage = UIImage(systemName: "slowmo")!
        let placeholder: UIImage = image.withTintColor(Color.activityIndicatorYellow, renderingMode: .alwaysOriginal)
        return placeholder
    }()
    
    lazy private var wallImageView: UIImageView = {
        
        let imgView: UIImageView = UIImageView(frame: .zero)
        imgView.contentMode   = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy private var stackView: UIStackView = {
       
        let stkView: UIStackView = UIStackView()
        stkView.alignment = .center
        stkView.distribution = .equalSpacing
        stkView.spacing = 8
        stkView.axis = .vertical
        stkView.contentMode = .center
        stkView.addArrangedSubview(self.wallImageView)
        
        return stkView
    }()
    
    lazy private var activityIndicator: UIActivityIndicatorView = {
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
        let width:  CGFloat = self.placeholderImage.size.width
        let height: CGFloat = Screen.height
        indicator.frame = CGRect(x: 0, y: 0, width: width, height: height)

        return indicator
    }()
    
    // MARK: - Initializers
    
    init(imageViewModel: ImageViewModel) {
        super.init(frame: CGRect(x: 0, y: 0, width: Screen.width, height: Screen.height))
        
        self.wallImageView.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        
        self.wallImageView.image = self.placeholderImage
        imageViewModel.$image.sink { [weak self] image in
            if let im = image {
                
                guard let rotated = im.rotateRight else { return }

                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.removeFromSuperview()
                
                self?.wallImageView.image = rotated.blend(with: Color.white, alpha: 0.2)
            }
        }.store(in: &cancellables)
        
        self.addSubview(self.stackView)
        self.defineConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
    // MARK: - Constraint definitions for View Elements
     
    private func defineConstraints() {
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 4).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
