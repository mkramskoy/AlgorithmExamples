//
//  Heap.swift
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/4/16.
//  Copyright © 2016 Connector. All rights reserved.
//

import Foundation


class MaxHeap <T: Comparable> {
    
    var array = [T]()
    
    init() {

    }
    
    init(array: [T]) {
        
        heapify(array: array)
    }
    
    func peekMaxElement() -> T? {
        
        if array.count == 0 { return nil }
        
        return array.first
    }
    
    func popMaxElement() -> T? {
        
        if isEmpty() {
            return nil
        }
        else if array.count == 1 {
            return array.removeLast()
        }
        else {
            swap(&array[0], &array[array.count-1])
            let maxElement = array.removeLast()
            
            heapifyDown(index: 0)
            
            return maxElement
        }
    }
    
    func add(_ element: T) {
        
        self.array.append(element)
        
        heapifyUp(index: array.count - 1)
    }
    
    func isEmpty() -> Bool {
        
        return array.isEmpty
    }
    
    private func heapify(array: [T]) {
        
        self.array = array
        for i in stride(from: (self.array.count/2 - 1), through: 0, by: -1) {
            heapifyDown(index: i)
        }
    }
    
    private func heapifyUp(index: Int) {
        
        var child = index
        var parent = self.parent(of: index)
        
        while (child >= 0 && array[parent] < array[child]) {
            swap(&array[parent], &array[child])
            
            child = parent
            parent = self.parent(of: child)
        }
    }
    
    private func heapifyDown(index: Int) {
        
        var parent = index
        
        while (true) {
            
            let leftChild = self.leftChild(of: parent)
            let rightChild = self.rightChild(of: parent)
            
            var first = parent
            if leftChild < self.array.count && array[leftChild] > array[first] {
                first = leftChild
            }
            if rightChild < self.array.count && array[rightChild] > array[first] {
                first = rightChild
            }
            
            if first == parent {
                return
            }
            
            swap(&array[parent], &array[first])
            parent = first
        }
    }
    
    private func parent(of index: Int) -> Int {
        
        return (index - 1)/2
    }
    
    private func leftChild(of index: Int) -> Int {
        
        return 2*index + 1
    }
    
    private func rightChild(of index: Int) -> Int {
        
        return 2*index + 2
    }
}
