//
//  Range.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 10/22/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class RangeOperations {
    class func overlaps<T: Comparable>(_ range1: Range<T>, _ range2: Range<T>) -> Bool {
        if range2.lowerBound > range1.lowerBound && range1.upperBound > range2.lowerBound {
            return true
        }
        
        if range2.lowerBound <= range1.lowerBound && range1.lowerBound < range2.upperBound {
            return true
        }
        
        return false
    }
    
    class func contains<T: Comparable>(_ range1: Range<T>, _ range2: Range<T>) -> Bool {
        if range1.lowerBound <= range2.lowerBound && range1.upperBound >= range2.upperBound {
            return true
        }
        
        return false
    }
    
    class func run() {
        let range1 = Range(uncheckedBounds: (lower: 0, upper: 1))
        let range2 = Range(uncheckedBounds: (lower: 1, upper: 3))
        
        let isOverlaping = overlaps(range1, range2)
        
        print("\(isOverlaping)")
    }
}


