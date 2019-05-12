//
//  CALayerExtension.swift
//  SampleDesignUI
//
//  Created by MacBook Pro on 12/05/2019.
//  Copyright © 2019 Naeem Paracha. All rights reserved.
//

import UIKit
import Foundation

extension CALayer {
    func addGradienBorder(colors:[UIColor],width:CGFloat = 1) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame =  CGRect(origin: CGPoint(x: 0, y: 0), size: self.bounds.size)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = colors.map({$0.cgColor})
        gradientLayer.cornerRadius = width / 2
        gradientLayer.masksToBounds = false
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius:width / 2).cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        //shapeLayer.cornerRadius  = width / 2
        gradientLayer.mask = shapeLayer
        self.addSublayer(gradientLayer)
    }
    
}
