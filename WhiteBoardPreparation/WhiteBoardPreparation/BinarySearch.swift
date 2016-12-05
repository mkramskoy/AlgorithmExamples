//
//  BinarySearch.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 10/26/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

func binarySearch<T: Comparable>(array: [T], key: T) -> Int? {
    
    if array.count == 0 {
        return nil
    }
    
    var leftIndex = 0
    var rightIndex = array.count
    
    while leftIndex != rightIndex {
        
        let middleIndex = leftIndex + (rightIndex - leftIndex)/2
        
        if key < array[middleIndex] {
            rightIndex = middleIndex
        }
        else if key > array[middleIndex] {
            leftIndex = middleIndex + 1
        }
        else {
            return middleIndex
        }
    }
    
    return nil
}
