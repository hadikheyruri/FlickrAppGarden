//
//  UIImageExt.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

extension UIImage {
    
    // MARK: - Resize Method

    func resizeImage(with size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return resizedImage
    }
    
    // MARK: - Scale Method

    func scaleImage(by factor: CGFloat) -> UIImage? {
        
        let width: CGFloat = self.size.width * factor
        let height: CGFloat = self.size.height * factor
        let size: CGSize = CGSize(width: width, height: height)
        
        return resizeImage(with: size)
    }
    
    // MARK: - Normalize Methods

    func normalizeHeight(with height: CGFloat) -> UIImage? {
        
        let factor: CGFloat = height/self.size.height
        let width: CGFloat = factor * self.size.width
        let size: CGSize = CGSize(width: width, height: height)
        
        return resizeImage(with: size)
    }
    
    func normalizeWidth(with width: CGFloat) -> UIImage? {
        
        let factor: CGFloat = width/self.size.width
        let height: CGFloat = factor * self.size.height
        let size: CGSize = CGSize(width: width, height: height)
        
        return resizeImage(with: size)
    }
    
    // MARK: - Rotation

    var rotateLeft: UIImage? {
        
        guard let cgImage = self.cgImage else { return nil }
        let rotatedImage = UIImage(cgImage: cgImage, scale: 1.0, orientation: .left)
        
        return rotatedImage
    }
    
    var rotateRight: UIImage? {
        
        guard let cgImage = self.cgImage else { return nil }
        let rotatedImage = UIImage(cgImage: cgImage, scale: 1.0, orientation: .right)
        
        return rotatedImage
    }
    
    // MARK: - Blend Methods

    func blend(with topImage: UIImage, alpha: CGFloat) -> UIImage? {
        
        let bottomImage = self
        let size = self.size
        
        UIGraphicsBeginImageContext(size)
        let area = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        bottomImage.draw(in: area, blendMode: .normal, alpha: 1)
        topImage.draw(in: area, blendMode: .luminosity, alpha: alpha)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func blend(with color: UIColor, alpha: CGFloat) -> UIImage? {
        let coloredImage : UIImage = color.image(self.size)
        return self.blend(with: coloredImage, alpha: alpha)
    }
}
