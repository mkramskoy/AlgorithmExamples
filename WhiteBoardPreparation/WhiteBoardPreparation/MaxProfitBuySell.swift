//
//  MaxProfitBuySell.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 2/14/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class MaxProfitBuySell {
    class func run() {
        let array = [2, 5, 3, 5, 4, 3, 1, 10]
        
        var result = 0
        
        var min = array[0]
        var minBuy = [Int]()
        for number in array {
            if number < min {
                min = number
            }
            
            minBuy.append(min)
        }
        
        for index in 0..<array.count {
            let profit = array[index] - minBuy[index]
            if profit > result {
                result = profit
            }
        }
        
        print("Max profit = \(result)")
    }
}
