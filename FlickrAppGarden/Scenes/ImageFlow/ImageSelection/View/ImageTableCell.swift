//
//  ImageTableCell.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit
import Combine

/**
 * Meme Image Table View Cell
 */
final class ImageTableCell: UITableViewCell {
    
    /*
     * MARK: - Properties
     */
    
    private var cancellables: Set<AnyCancellable> = []
    
    static var reuseIdentifier: String {
        return String(describing: self) + "Identifier"
    }
    
    var imageViewModel: CellImageViewModel? {
        didSet {
            
            self.wallImageView.image = self.placeholderImage
            imageViewModel?.$image.sink { [unowned self] image in
                if let im = image {
                    self.wallImageView.image = im
                }
            }.store(in: &cancellables)
        }
    }
    
    /*
     * MARK: - View Elements
     */
    
    private let placeholderImage: UIImage = {
        let placeholder: UIImage = UIImage(systemName: "rectangle")!
        return placeholder
    }()
    
    lazy private var wallImageView: UIImageView = {
        
        let imgView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
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

        [self.wallImageView].forEach( {
            stkView.addArrangedSubview($0)
        })
        
        return stkView
    }()
    
    
    /*
     * MARK: - Initializers
     */
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 4, left: 24, bottom: 24, right: 24)
        self.addSubview(self.stackView)
        self.defineConstraints()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
    /*
     * MARK: - Constraint definitions for View Elements
     */
    
    private func defineConstraints() {
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
