//
//  ViewController.swift
//  DabbletMenu
//
//  Created by Ekin Ertac on 25/04/15.
//  Copyright (c) 2015 Ekin Ertac. All rights reserved.
//

import UIKit

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

class ParallaxImageTableViewController: UITableViewController, UIScrollViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("ParallaxCell") as! UITableViewCell
        var image = cell.viewWithTag(1) as! UIImageView
        var label = cell.viewWithTag(2) as! UILabel
        var overlay = cell.viewWithTag(3)
        
       // overlay!.frame = CGRect(x: image.frame.minX, y: image.frame.minY, width: image.frame.width, height: image.frame.height)
        
        label.text = labels[indexPath.row]
        label.textColor = UIColor.whiteColor()
        image.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var form  = self.storyboard!.instantiateViewControllerWithIdentifier("form") as! UIViewController
        self.navigationController!.pushViewController(form, animated: true)
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
   
        for item in 0...images.count {
            var indexPath = NSIndexPath(forRow: item, inSection: 0)
            var cell = tableView.cellForRowAtIndexPath(indexPath)
            if cell != nil {
                var image = cell!.viewWithTag(1) as! UIImageView
                image.center = CGPoint(x: image.center.x, y: 75 + scrollView.contentOffset.y  * 0.5)
                
                if(image.center.y  <  25){
                    image.center = CGPoint(x: image.center.x, y: 25)
                }
                
                if(image.center.y  > 95){
                    image.center = CGPoint(x: image.center.x, y: 95)
                }
            }
        }
    }
}

















