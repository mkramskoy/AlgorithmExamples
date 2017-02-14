//
//  MoveZeroesToTheRight.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/6/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class MoveZeroesToTheRight {
    class func run() {
        var arr = [0, 1, 2, 3, 1, 1, 2, 3, 0, 0, 0, 0]
        
        arr = moveZeroesToRight(arr)
        print("\(arr)")
    }
    
    public class func moveZeroesToRight(_ array: [Int]) -> [Int] {
        var result = array
        for index in 0..<array.count {
            if result[index] == 0 {
                if let nonZeroIndex = findNonZero(in: result, startIndex: index) {
                    swap(&result[index], &result[nonZeroIndex])
                }
                else {
                    break
                }
            }
        }
        
        return result
    }
    
    private class func findNonZero(in array: [Int], startIndex: Int ) -> Int? {
        for index in stride(from:array.count-1, to:0, by:-1) {
            if startIndex >= index {
                return nil
            }
            
            if array[index] != 0 {
                return index
            }
        }
        
        return nil
    }
}







