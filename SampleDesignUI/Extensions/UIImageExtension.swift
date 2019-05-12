//
//  UIColorExtension.swift
//  SampleDesignUI
//
//  Created by MacBook Pro on 12/05/2019.
//  Copyright © 2019 Naeem Paracha. All rights reserved.
//

import UIKit
import Foundation

extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

