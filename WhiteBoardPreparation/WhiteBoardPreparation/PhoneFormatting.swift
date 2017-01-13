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
    
}
