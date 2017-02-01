//
//  Queue.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/5/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class Queue<T> {
    
    private var array = [T]()
    
    func pop() -> T? {
        return self.isEmpty() ? nil : self.array.removeFirst()
    }
    
    func push(_ element: T) {
        self.array.append(element)
    }
    
    func peek() -> T? {
        return self.isEmpty() ? nil : self.array.first
    }
    
    func isEmpty() -> Bool {
        return self.array.count == 0
    }
}
