//
//  UILabelExtension.swift
//  SampleDesignUI
//
//  Created by MacBook Pro on 12/05/2019.
//  Copyright © 2019 Naeem Paracha. All rights reserved.
//

import UIKit

struct LabelAnimateAnchorPoint {
    // You can add more suitable archon point for your needs
    static let leadingCenterY         = CGPoint.init(x: 0, y: 0.5)
    static let trailingCenterY        = CGPoint.init(x: 1, y: 0.5)
    static let centerXCenterY         = CGPoint.init(x: 0.5, y: 0.5)
    static let leadingTop             = CGPoint.init(x: 0, y: 0)
}

extension UILabel {
    func animate(fontSize: CGFloat, duration: TimeInterval, animateAnchorPoint: CGPoint) {
        var newFontSize = fontSize
        newFontSize = newFontSize + 5.0
        let startTransform = transform
        let oldFrame = frame
        var newFrame = oldFrame
        let archorPoint = layer.anchorPoint
        let scaleRatio = fontSize / font.pointSize
        
        layer.anchorPoint = animateAnchorPoint
        
        newFrame.size.width *= scaleRatio
        newFrame.size.height *= scaleRatio
        newFrame.origin.x = oldFrame.origin.x - (newFrame.size.width - oldFrame.size.width) * animateAnchorPoint.x
        newFrame.origin.y = oldFrame.origin.y - (newFrame.size.height - oldFrame.size.height) * animateAnchorPoint.y
        frame = newFrame
        
        font = font.withSize(newFontSize)
        
        transform = CGAffineTransform.init(scaleX: 1 / scaleRatio, y: 1 / scaleRatio);
        layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            self.transform = startTransform
            newFrame = self.frame
        }) { (Bool) in
            self.layer.anchorPoint = archorPoint
            self.frame = newFrame
            self.layer.opacity = 0
            self.removeFromSuperview()
        }
    }
}
