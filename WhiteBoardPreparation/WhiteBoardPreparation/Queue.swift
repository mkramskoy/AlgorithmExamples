//
//  Queue.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/5/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class Queue {
    
    private var array = [Any]()
    
    func pop() -> Any? {
        return self.isEmpty() ? nil : self.array.removeFirst()
    }
    
    func push(_ element: Any) {
        self.array.append(element)
    }
    
    func peek() -> Any? {
        return self.isEmpty() ? nil : self.array.first
    }
    
    func isEmpty() -> Bool {
        return self.array.count == 0
    }
}
