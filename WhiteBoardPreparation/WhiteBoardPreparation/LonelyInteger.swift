//
//  LonelyInteger.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 2/1/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class LonelyInteger {
    class func run() {
        // find a single int that doesn't have pair
        let array = [1, 1, 2, 4, 2, 4, 3, 3, 9]
        
        var result = 0
        for int in array {
            result ^= int
        }
    
        print("bit manipulation \(result)")
    }
    
}
