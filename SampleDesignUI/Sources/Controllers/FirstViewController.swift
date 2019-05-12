//
//  FirstViewController.swift
//  SampleDesignUI
//
//  Created by MacBook Pro on 11/05/2019.
//  Copyright © 2019 Naeem Paracha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tanleView: UITableView!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var bottomView : UIView!
    @IBOutlet weak var btnLikes: UIButton!
    
    @IBOutlet weak var maxNumberOfLikesLabel: UILabel!
    
    var numberOfLikes: Int! = 0
    var maanumberOfLikes = 0
    var counter = 0
    
    let albums = [
        GameAlbumModel(artirst: "August Burns Red", name: "Constellations", image: "01", isFav: false , likes: "22"),
        GameAlbumModel(artirst: "Breakdown of Sanity", name: "Mirrors", image: "02", isFav: true , likes: ""),
        GameAlbumModel(artirst: "Currents", name: "The place I feel safest", image: "03", isFav: false , likes: "8"),
        GameAlbumModel(artirst: "Make Them Suffer", name: "Neverbloom", image: "04", isFav: false , likes: "2"),
        GameAlbumModel(artirst: "Parkway Drive", name: "Reverence", image: "05", isFav: false , likes: ""),
        GameAlbumModel(artirst: "The Haunted", name: "Exit wounds", image: "06", isFav: false , likes: ""),
        GameAlbumModel(artirst: "Upon a Burning Body", name: "Red White Green", image: "07", isFav: false , likes: ""),
        GameAlbumModel(artirst: "Whitechapel", name: "Our endless war", image: "08", isFav: false , likes: ""),
        GameAlbumModel(artirst: "August Burns Red", name: "Constellations", image: "01", isFav: false , likes: "22"),
        GameAlbumModel(artirst: "Breakdown of Sanity", name: "Mirrors", image: "02", isFav: true , likes: ""),
        GameAlbumModel(artirst: "Currents", name: "The place I feel safest", image: "03", isFav: false , likes: "8"),
        GameAlbumModel(artirst: "Make Them Suffer", name: "Neverbloom", image: "04", isFav: false , likes: "2"),
        GameAlbumModel(artirst: "Parkway Drive", name: "Reverence", image: "05", isFav: false , likes: ""),
        GameAlbumModel(artirst: "The Haunted", name: "Exit wounds", image: "06", isFav: false , likes: ""),
        GameAlbumModel(artirst: "Upon a Burning Body", name: "Red White Green", image: "07", isFav: false , likes: ""),
        GameAlbumModel(artirst: "Whitechapel", name: "Our endless war", image: "08", isFav: false , likes: ""),
        ]
    
    let commentsArray = [
        CommentsModel(name: "August Red", description: "@Spokemón, Woah, simmer down there amigo."),
        CommentsModel(name: "August Burns", description: "Constellations 2"),
        CommentsModel(name: "Burns Red", description: "Constellations 3"),
        CommentsModel(name: "Red", description: "Constellations 4"),
        CommentsModel(name: "Burns", description: "Constellations 5"),
        CommentsModel(name: "August", description: "Constellations 6"),
        CommentsModel(name: "Burns Red", description: "Constellations 7"),
        CommentsModel(name: "Red", description: "Constellations 8"),
        CommentsModel(name: "Burns Red", description: "Constellations 9"),
        CommentsModel(name: "August", description: "Constellations 10"),
        
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        numberOfLikes = Int(btnLikes.currentTitle ?? "0") ?? 0
        maanumberOfLikes  = Int(maxNumberOfLikesLabel.text ?? "0") ?? 0
        starImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.addPulse))
        tapGestureRecognizer.numberOfTapsRequired = 1
        starImageView.addGestureRecognizer(tapGestureRecognizer)
        
        self.adddShadow()
    }

    @objc func addPulse()
    {
        if numberOfLikes > 0
        {
            let  x = starImageView.frame.origin.x + (starImageView.frame.size.width / 2)
            let  y = starImageView.frame.origin.y + (starImageView.frame.size.height / 2)
            let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: CGPoint(x: x, y: y) )
            pulse.animationDuration = 0.8
            pulse.backgroundColor = UIColor.orange.cgColor
            
            self.bottomView.layer.insertSublayer(pulse, below: starImageView.layer)
            self.performIncreament()
            
            
            let number = CGFloat.random(in: 0 ..< 5)
            let lbl = UILabel(frame: CGRect(x: x - (number * 10), y: bottomView.frame.origin.y - y, width: 50, height: 20))
            lbl.textColor = random(colors: [.blue, .green, .red, .yellow])
            counter = counter  + 1
            lbl.text = "+" + String(counter)
            self.view.addSubview(lbl)
            lbl.animate(fontSize: 16, duration: 1.5, animateAnchorPoint: CGPoint(x: -10, y: -1000))
        }
        
        
    }
    
    @IBAction func resetLikes(_ sender: Any)
    {
        numberOfLikes = 10
        btnLikes.setTitle(String(numberOfLikes), for: .normal)
        
        maanumberOfLikes = 10
        maxNumberOfLikesLabel.text = String(maanumberOfLikes)
        
        counter  = 0
    }
    
    func adddShadow()
    {
        // *** Set masks bounds to NO to display shadow visible ***
        self.bottomView.layer.masksToBounds = false;
        // *** Set light gray color as shown in sample ***
        self.bottomView.layer.shadowColor = UIColor.black.cgColor;
        // *** *** Use following to add Shadow top, left ***
        self.bottomView.layer.shadowOffset = CGSize(width: 0, height: -5)
        
        // *** Use following to add Shadow bottom, right ***
        //self.avatarImageView.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
        
        // *** Use following to add Shadow top, left, bottom, right ***
        // avatarImageView.layer.shadowOffset = CGSizeZero;
        // avatarImageView.layer.shadowRadius = 5.0f;
        
        // *** Set shadowOpacity to full (1) ***
        self.bottomView.layer.shadowOpacity = 0.3;
    }
    
    func performIncreament()
    {
        maanumberOfLikes = maanumberOfLikes + 1
        numberOfLikes = numberOfLikes - 1
        btnLikes.setTitle(String(numberOfLikes), for: .normal)
        maxNumberOfLikesLabel.text = String(maanumberOfLikes)
    }

    
    
    func random(colors: [UIColor]) -> UIColor {
        return colors[Int(arc4random_uniform(UInt32(colors.count)))]
        
    }
}

extension FirstViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        let albumDetails = albums[indexPath.row]
        cell.setData(albumDetails: albumDetails)
        return cell
    }
    
}

extension FirstViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

//Comments Work
extension FirstViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)  as! MyTableViewCell
        let comentData = commentsArray[indexPath.row]
        cell.nameLabel.text =  comentData.name
        cell.commentLabel.text = comentData.description
        return cell
    }
    
    
}

extension FirstViewController: UITableViewDelegate
{
    
}
