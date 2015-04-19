//
//  ViewController.swift
//  CalcPlus
//
//  Created by Ekin Ertac on 18/04/15.
//  Copyright (c) 2015 Ekin Ertac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Actions
    @IBAction func clearButtonDidTouch(sender: AnyObject) {
        resultLabel.text = ""
    }
    
    @IBAction func evaluateButtonDidTouch(sender: AnyObject) {
        evaulateString()
    }
    
    @IBAction func backspaceButtonDidTouch(sender: AnyObject) {
        resultLabel.text = deleteLastCharacter(resultLabel.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Background to gradient color
        let background = CAGradientLayer().gradient(top: "#fe4b41", bottom:"#992e84")
        background.frame = self.view.bounds
        // Add gradient to view
        self.view.layer.insertSublayer(background, atIndex: 0)
        
        for item in self.view.subviews {
            if item.isKindOfClass(UIButton) && item.tag == 1 {
                // Set target for number buttons
                item.addTarget(self, action: "numbersAndOperandsDidTouch:", forControlEvents: UIControlEvents.TouchUpInside)
            }

        }
    }

    func numbersAndOperandsDidTouch(sender: UIButton!) {
        let value = sender.titleLabel!.text!
        resultLabel.text = resultLabel.text! + value
    }

    func evaulateString() {
        let stringWithMathOperation = resultLabel.text!
        let expressionEngine = NSExpression(format: stringWithMathOperation)
        let calculatedResult: AnyObject = expressionEngine.expressionValueWithObject(nil, context: nil)
        resultLabel.text = "\(calculatedResult)"
    }
    
    func deleteLastCharacter(sendStr: String) -> String {
        var str: String = sendStr
        var result: String = ""
        let stringLength = count(str)
        if stringLength > 0 {
            let substringIndex = stringLength - 1
            result = str.substringToIndex(advance(str.startIndex, substringIndex))
        }
        return result
    }
    
}
