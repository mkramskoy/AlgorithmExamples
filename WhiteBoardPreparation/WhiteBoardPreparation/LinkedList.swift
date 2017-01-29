//
//  LinkedList.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 11/6/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class LinkedList {
    var next: LinkedList? = nil
    let label: String
    
    init(label: String) {
        self.label = label
    }
    
    func desc() -> String {
        var desc = self.label
        var child = self.next
        while child != nil {
            desc += child!.label
            child = child!.next
        }
        
        return desc
    }
}
