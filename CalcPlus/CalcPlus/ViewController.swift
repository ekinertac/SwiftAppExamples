//
//  ViewController.swift
//  CalcPlus
//
//  Created by ekinertac on 18/04/15.
//  Copyright (c) 2015 ekinertac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: Actions
    @IBAction func clearButtonDidTouch(sender: AnyObject) {
        // Clear text from resultLabel view
        resultLabel.text = ""
    }

    @IBAction func evaluateButtonDidTouch(sender: AnyObject) {
        // Call evaulate func
        evaulateString()
    }

    @IBAction func backspaceButtonDidTouch(sender: AnyObject) {
        // perform backspace event
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
        // Add button labels to resultLabel
        let value = sender.titleLabel!.text!
        resultLabel.text = resultLabel.text! + value
    }

    func evaulateString() {
        // Evaulte math string
        let stringWithMathOperation = resultLabel.text!
        let expressionEngine = NSExpression(format: stringWithMathOperation)
        let calculatedResult: AnyObject = expressionEngine.expressionValueWithObject(nil, context: nil)
        resultLabel.text = "\(calculatedResult)"
        // Safe to use eval in Swift <3
    }

    func deleteLastCharacter(sendStr: String) -> String {
        var str: String = sendStr // clone!
        var result: String = "" // return statement
        let stringLength = count(str)
        if stringLength > 0 {
            let substringIndex = stringLength - 1
            result = str.substringToIndex(advance(str.startIndex, substringIndex))
            // remove (totalCount - 1)nd char from string
        }
        return result
    }

}
