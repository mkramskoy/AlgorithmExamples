//
//  Radix.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 10/27/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class AddTwoBinaryNumbers {
    
    class func run() {
    
        let sum = addTwoNumbers2("11011010101011", "111001")
        print("\(sum)")
    }
    
    class func addTwoNumbers1(_ first: String, _ second: String) -> String {
        
        let input = [first, second]
        let sum = input.reduce(0) { (sum, value) -> Int in
            sum + Int(value, radix: 2)!
        }
        let output = String(sum, radix:2)
        
        return output
    }
    
    class func addTwoNumbers2(_ firstString: String, _ secondString: String) -> String {
    
        var first = firstString
        var second = secondString
         
        if first.characters.count < second.characters.count {
            while first.characters.count != second.characters.count {
                first.insert("0", at: first.startIndex)
            }
        }
        
        if first.characters.count > second.characters.count {
            while second.characters.count != first.characters.count {
                second.insert("0", at: first.startIndex)
            }
        }
        
        var sum: String = ""
        var carry: Int = 0
        
        var (start, end) = (first.index(before: first.endIndex), first.endIndex)
        
        var char1 = first.substring(with: start..<end)
        var char2 = second.substring(with: start..<end)
        
        for _ in stride(from: first.characters.count, to: 0, by: -1) {
            var intSum = Int(char1)! + Int(char2)!
            intSum += carry

            if intSum == 3 && carry == 1 {
                intSum = 1
                carry = 1
            }
            else if intSum == 2 {
                intSum = 0
                carry = 1
            }
            else if intSum == 1 && carry == 1 {
                carry = 0
            }
            
            sum = String(intSum) + sum
            
            if first.distance(from: first.startIndex, to: start) != 0 {
                (start, end) = (first.index(before: start), first.index(before: end))
                
                char1 = first.substring(with: start..<end)
                char2 = second.substring(with: start..<end)
            }
        }
        
        if carry != 0 {
            sum = "1" + sum
        }

        return sum
    }
}



/*
 
 input: "010", "11"
 output: "101"
 
 11
 011
 11
 ___
 110
 
 0,0,0 -> 0, 0
 0,1,0 -> 1, 0
 ...
 1,1,1 -> 1, 1
 
 */
//
//func addTwoNumbers(first: String, second: String) -> String {
//
//    if first.length == 0 { return second }
//
//    if second.length == 0 { return first }
//
//    var sum: String
//    var carry: String
//
//    var int1 = first.length - 1
//    var int2 = second.length - 1
//
//    var char1 = first.substing(int1-1..int1)
//    var char2 = second.substing(int2-1..int2)
//
//    while char1 != nil && char2 != nil {
//
//        var intSum = Int(char) + Int(char2)
//        intSum += carry
//
//        if intSum > 1 {
//            carry = 1
//            intSum -= 0
//            //dealing carry and sum
//        }
//
//        int1 -= 1
//        int2 -= 1
//
//        char1 = first.substing(int1-1..int1)
//        char2 = second.substing(int2-1..int2)
//    }
//
//    if char1 != nil {
//        while char1 != nil {
//
//        }
//    }
//
//    if char1 != nil {
//        while char1 != nil {
//
//        }
//    }
//
//}
