//
//  ViewController.swift
//  ParallaxCollection
//
//  Created by Ekin Ertac on 26/04/15.
//  Copyright (c) 2015 Ekin Ertac. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController, UICollectionViewDelegate,
    UICollectionViewDataSource, UIScrollViewDelegate {
    
    let images = [
        "antipasti-and-sides.jpg",
        "mains.jpg",
        "pasta.jpg",
        "desserts.jpg",
        "drinks.jpg",
        "kids.jpg"
    ]
    
    let labels = [
        "ANTIPASTI & SIDES",
        "MAINS",
        "PASTA",
        "DESSERTS",
        "DRINKS",
        "KIDS"
    ]

    @IBOutlet weak var parallaxCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parallaxCollectionView.delegate = self
        parallaxCollectionView.dataSource = self
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:ParallaxCollectionViewCell = collectionView
            .dequeueReusableCellWithReuseIdentifier(
                "ParallaxCell",
                forIndexPath: indexPath
            ) as! ParallaxCollectionViewCell
        
        var imageName:String = images[indexPath.row]
        var imageForCell:UIImage! = UIImage(named: imageName)
        cell.image = imageForCell
        
        let imageOffsetY:CGFloat = ((collectionView.contentOffset.y - cell.frame.origin.y) / 200) * 25
        cell.imageOffset = CGPointMake(0, imageOffsetY)
        
        return cell
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        for view in parallaxCollectionView.visibleCells() {
            var view:ParallaxCollectionViewCell = view as! ParallaxCollectionViewCell
            let yOffset:CGFloat = ((parallaxCollectionView.contentOffset.y - view.frame.origin.y) / 200) * 25
            view.setImageOffset(CGPointMake(0, yOffset))

        }
    }

}

