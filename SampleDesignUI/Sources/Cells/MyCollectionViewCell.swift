//
//  CollectionViewCustomCell.swift
//  SampleDesignUI
//
//  Created by MacBook Pro on 11/05/2019.
//  Copyright © 2019 Naeem Paracha. All rights reserved.
//

import UIKit
class MyCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    
    @IBOutlet weak var albumLabelbadge: UILabel!
    @IBOutlet weak var albumImagebade: UIImageView!
    
    @IBOutlet weak var albumImaeSuperView: UIView!
    
    func setData(albumDetails:GameAlbumModel)
    {
        self.albumLabel.text = albumDetails.name
        self.albumLabel.font = UIFont.systemFont(ofSize: 12.0)
        self.albumImage.image = UIImage.init(named: albumDetails.image)
        
        if albumDetails.isFav
        {
            self.albumImagebade.isHidden  =  false
            self.albumLabelbadge.isHidden = true
            self.albumImagebade.frame = CGRect(x: self.albumImage.frame.size.width - (#imageLiteral(resourceName: "starIcon").size.width/2) + 10, y: (self.albumImage.frame.size.height - #imageLiteral(resourceName: "starIcon").size.height) - 20, width: #imageLiteral(resourceName: "starIcon").size.width, height: #imageLiteral(resourceName: "starIcon").size.height)
            self.albumLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
            self.albumLabel.textColor = UIColor.white
            self.albumImagebade.clipsToBounds = true
            self.albumImagebade.layer.cornerRadius = self.albumImagebade.frame.size.width / 2
            self.albumImaeSuperView.layer.borderColor = UIColor(patternImage: UIImage.gradientImageWithBounds(bounds: self.albumImaeSuperView.frame, colors: [UIColor.orange.cgColor, UIColor.blue.cgColor])).cgColor
        }
        else if albumDetails.likes.count > 0
        {
            self.albumImagebade.isHidden  =  true
            self.albumLabelbadge.isHidden = false
            self.albumLabelbadge.frame = CGRect(x: self.albumImage.frame.size.width - (self.albumLabelbadge.frame.size.width/2) + 10, y: (self.albumImage.frame.size.height - self.albumLabelbadge.frame.size.height) - 20, width: self.albumLabelbadge.frame.size.width, height: self.albumLabelbadge.frame.size.height)
            self.albumLabelbadge.text = albumDetails.likes
            self.albumLabelbadge.clipsToBounds = true
            self.albumLabelbadge.layer.cornerRadius = self.albumImagebade.frame.size.width / 2
            self.albumImaeSuperView.layer.borderColor = UIColor.white.cgColor
        }
        else
        {
            self.albumImaeSuperView.layer.borderColor = UIColor.darkGray.cgColor
            self.albumLabel.textColor = UIColor.lightText
            self.albumImagebade.isHidden  =  true
            self.albumLabelbadge.isHidden = true
        }
    }
}
