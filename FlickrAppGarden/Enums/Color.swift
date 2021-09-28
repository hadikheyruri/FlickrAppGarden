//
//  Color.swift
//  FlickrAppGarden
//
//  Created by Hadi Kheyruri on 2021-09-27.
//

import UIKit

enum Color {
    
    static public let activityIndicatorYellow: UIColor = UIColor(red: 255, green: 255, blue: 0, alpha: 0.6)
    static public let yellow: UIColor = UIColor(red: 255, green: 255, blue: 0, alpha: 1)
    static public let white: UIColor = UIColor.white
    static public let black: UIColor = UIColor.black
    static public let clear: UIColor = UIColor.clear
    static public let navigationTintColor: UIColor = UIColor(red: 240, green: 240, blue: 0, alpha: 0.5)
    static public let semiClear: UIColor = UIColor(red: 10, green: 10, blue: 10, alpha: 0.5)
}


fileprivate extension UIColor {
    
    // MARK: - Convenience Initializer

    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) {
        self.init(displayP3Red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}
