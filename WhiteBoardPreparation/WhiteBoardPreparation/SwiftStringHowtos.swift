//
//  SwiftStringHowtos.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/29/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class SwiftStringHowtos {
    
    func aaa() {
        //replacing characters
        let _ = "".trimmingCharacters(in: .whitespaces)
        let _ = "".replacingOccurrences(of: "\"", with: "", options: .literal, range:nil)
        
        //iterating thru string
        var string = "aa🔡💩👹"
        var counter = 0
        for index in string.characters.indices {
            let currentChar = string[index]
            
            print("Symbol = \(currentChar), index = \(index), counter = \(counter)")
            
            counter += 1
        }
        
        //secong way to do it
        var i = string.startIndex
        while i != string.endIndex {
            print("Symbol = \(string[i]), index = \(i)")
            
            i = string.index(after: i)
        }
        
        //repeated string
        var _ = String(repeating:"a", count: 5)
        
        //converting string into array of ints
        let intString = "12345"
        let _: [Int] = intString.characters.enumerated().map { index, character -> Int in
            return Int(String(character))!
        }
    }
}

