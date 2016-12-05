//
//  MaxHeap.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 10/24/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation


class MaxHeapSort {
    
    class func run() {
        
        let heap = MaxHeap<Int>(array:[1, 17, 3, 6, 2, 34, 23, 103])
        
//        heap.add(1)
//        heap.add(17)
//        heap.add(3)
//        heap.add(6)
//        heap.add(2)
//        heap.add(34)
//        heap.add(23)
//        heap.add(103)
        
        while !heap.isEmpty() {
            
            print("\(heap.popMaxElement())")
        }
    }
}




