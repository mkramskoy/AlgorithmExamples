//
//  Stack.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 2/3/17.
//  Copyright © 2017 Connector. All rights reserved.
//

import Foundation

class Stack<T> {
    private var root: StackNode?
    
    func push(_ object: T) {
        root = StackNode(value: object, next: root)
    }
    
    func pop() -> T? {
        let objectToReturn = root?.value as! T?
        root = root?.next
        return objectToReturn
    }
    
    func peek() -> T? {
        let objectToReturn = root?.value as! T?
        return objectToReturn
    }
    
    func isEmpty() -> Bool {
        return root == nil
    }
}

fileprivate class StackNode {
    let next: StackNode?
    let value: Any
    
    init(value: Any, next: StackNode? = nil) {
        self.value = value
        self.next = next
    }
}


