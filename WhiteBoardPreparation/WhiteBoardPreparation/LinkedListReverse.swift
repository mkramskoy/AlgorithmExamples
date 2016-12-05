//
//  LinkedListReverse.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 10/27/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation

class LinkedListReverse {
    class func reverse(_ linkedList: LinkedList) -> LinkedList {
        var prev: LinkedList? = nil
        var current: LinkedList? = linkedList
        while current != nil {
            let next = current!.next
            current!.next = prev
            prev = current
            
            current = next
        }
        return prev!
    }
    
    class func nodeAtAndAfter(index: Int, list: LinkedList) -> (LinkedList?, LinkedList?) {
        if index < 0 { return (nil, nil)}
        
        var i = index
        var current: LinkedList? = list
        var prev: LinkedList?
        
        while current != nil && i > 0 {
            i -= 1
            prev = current
            current = current!.next
        }
        assert(i == 0)
        return (prev, current)
    }
    
    class func run() {
        let list1 = LinkedList(label: "1")
        let list2 = LinkedList(label: "2")
        let list3 = LinkedList(label: "3")
        let list4 = LinkedList(label: "4")
        let list5 = LinkedList(label: "5")
        
        list1.next = list2
        list2.next = list3
        list3.next = list4
        list4.next = list5
        
        print("\(list1.desc())")
//        list1 = reverse(list1)
//        print("\(list1.desc())")
        
        let (prev, next) = nodeAtAndAfter(index: 1, list: list1)
        print("\(prev?.label) \(next?.label)")
    }
}

