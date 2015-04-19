//
//  Utils.swift
//  CalcPlus
//
//  Created by Ekin Ertac on 19/04/15.
//  Copyright (c) 2015 Ekin Ertac. All rights reserved.
//

import UIKit

class Calculate {
    func add(from: String, to: String) -> Int {
        return from.toInt()! + to.toInt()!
    }
    
    func subtract(from: String, to: String) -> Int {
        return from.toInt()! - to.toInt()!
    }
    
    func multiply(from: String, to: String) -> Int {
        return from.toInt()! * to.toInt()!
    }
    
    func divide(from: String, to: String) -> Int {
        return from.toInt()! / to.toInt()!
    }
}
