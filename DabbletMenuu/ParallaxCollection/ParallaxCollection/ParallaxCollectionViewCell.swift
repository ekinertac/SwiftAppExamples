//
//  ParallaxCollectionViewCell.swift
//  ParallaxCollection
//
//  Created by Ekin Ertac on 26/04/15.
//  Copyright (c) 2015 Ekin Ertac. All rights reserved.
//

import UIKit

class ParallaxCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var imageOffset: CGPoint!
    
    var image:UIImage!{
        get{ return self.image }
        set{
            self.imageView.image = newValue
            if imageOffset != nil {
                setImageOffset(imageOffset)
            }else{
                setImageOffset(CGPointMake(0, 0))
            }
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupImageView()
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setupImageView()
    }
    
    
    func setImageOffset(imageOffset: CGPoint){
        self.imageOffset = imageOffset
        let frame:CGRect = imageView.bounds
        let offsetFrame:CGRect = CGRectOffset(frame, self.imageOffset.x, self.imageOffset.y)
        imageView.frame = offsetFrame
    }
    
    
    func setupImageView(){
        self.clipsToBounds = true

        imageView = UIImageView(frame: CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 320, 155))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = false
        self.addSubview(imageView)
    }
    
    
}
