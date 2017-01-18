//
//  PhoneFormatting.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/13/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Cocoa

class PhoneFormatting: NSObject {

    class func run() {
        
        var formattedString = formatPhoneNumber("234 230-23 235-1 123 1") //should be 234-230-232-351-12-31
        print("\(formattedString)")
        formattedString = formatPhoneNumber("23 235-1 1233 11") //should be 232-351-123-311
        print("\(formattedString)")
        formattedString = formatPhoneNumber("23 2351-1 12233 11") //should be 232-351-112-233-11
        print("\(formattedString)")
        formattedString = formatPhoneNumber("2311") //should be 23-11
        print("\(formattedString)")
    }
    
    class func formatPhoneNumber(_ string: String) -> String {

        var string = string.replacingOccurrences(of: "-", with: "", options: .literal, range:nil)
        string = string.replacingOccurrences(of: " ", with: "", options: .literal, range:nil)

        var currentIndex: String.Index? = string.endIndex
        var counter = 0

        while let index = currentIndex {
            counter += 1
            var counterThrashhold = 3

            if (string.distance(from:index, to: string.startIndex)-1) % 3 != 0 {
                counterThrashhold = 2
            }

            if counter >= counterThrashhold {
                counter = 1
                if let dashIndex = string.index(index, offsetBy:-1, limitedBy: string.startIndex) {
                    if dashIndex != string.startIndex {
                        string.insert(Character("-"), at:dashIndex)
                    }
                }

                currentIndex = string.index(index, offsetBy:-2, limitedBy: string.startIndex)
            }
            else {
                currentIndex = string.index(index, offsetBy:-1, limitedBy: string.startIndex)
            }
        }
        
        return string
    }
    
//    func solution(_ S: String) -> String {
//        let digitComponents = S.components(separatedBy: CharacterSet.decimalDigits.inverted)
//        let s = digitComponents.reduce("", +)
//        
//        if s.characters.count < 3 {
//            return s
//        }
//        
//        var (result, mod) = s.components(each: 3)
//        if mod.characters.count == 4 {
//            result.append(contentsOf: mod.components(each: 2).result)
//        } else if mod.characters.count == 5 {
//            let index = mod.index(mod.startIndex, offsetBy: 3)
//            result.append(mod.substring(to: index))
//            result.append(mod.substring(from: index))
//        }
//        return result.joined(separator: "-")
//    }

}

//extension String {
//    func components(each: Int) -> (result: [String], mod: String) {
//        let length = self.characters.count
//        var result = [String]()
//        if length < each {
//            return (result, self)
//        }
//        
//        var value = self
//        var valueLength = value.characters.count
//        let isEnough: EachComponents = { (value, each) in
//            (value == 0) || (1...each-1).contains(value - each)
//        }
//        var flag = isEnough(valueLength, each)
//        
//        while !flag {
//            let index = value.index(value.startIndex, offsetBy: each)
//            let substring = value.substring(to: index)
//            value = value.replacingOccurrences(of: substring, with: "")
//            valueLength = value.characters.count
//            result.append(substring)
//            flag = isEnough(valueLength, each)
//        }
//        
//        return (result, value)
//    }
//}
