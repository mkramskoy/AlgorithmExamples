//
//  RSelect.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/18/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class RSelect {
    class func run() {
        let integers = [4, 80, 70, 23, 9, 60, 68, 27, 66, 78, 12, 40, 52, 53, 44, 8, 49, 28, 18, 46, 21, 39, 51, 7, 87, 99, 69, 62, 84, 6, 79, 67, 14, 98, 83, 0, 96, 5, 82, 10, 26, 48, 3, 2, 15, 92, 11, 55, 63, 97, 43, 45, 81, 42, 95, 20, 25, 74, 24, 72, 91, 35, 86, 19, 75, 58, 71, 47, 76, 59, 64, 93, 17, 50, 56, 94, 90, 89, 32, 37, 34, 65, 1, 73, 41, 36, 57, 77, 30, 22, 13, 29, 38, 16, 88, 61, 31, 85, 33, 54];
        
        let result = integers.rSelect(index: 50)
        
        print("RSelect result \(result)")
    }
}


extension Array where Element: Comparable {
    public func rSelect(index: Int) -> Element {
        var selfCopy = self
        let result = selfCopy.rSelect(index: index, begin: 0, end: selfCopy.count-1)
        return result
    }
    
    private mutating func rSelect(index: Int, begin: Int, end: Int) -> Element {
        if end - begin < 1 { return self[begin] }
        
        var pivotIndex = choosePivotBetween(begin, end)
        pivotIndex = partitionAroundPivot(pivotIndex, begin, end)
        
        if pivotIndex == index {
            return self[pivotIndex]
        }
        else if pivotIndex > index {
            return rSelect(index: index, begin:begin, end: pivotIndex-1)
        }
        else {
            return rSelect(index: index, begin:pivotIndex+1, end: end)
        }
    }
}
