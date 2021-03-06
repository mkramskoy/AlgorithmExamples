import Foundation

class QuickSort {
    
    class func run() {
        
        var integers = [4, 80, 70, 23, 9, 60, 68, 27, 66, 78, 12, 40, 52, 53, 44, 8, 49, 28, 18, 46, 21, 39, 51, 7, 87, 99, 69, 62, 84, 6, 79, 67, 14, 98, 83, 0, 96, 5, 82, 10, 26, 48, 3, 2, 15, 92, 11, 55, 63, 97, 43, 45, 81, 42, 95, 20, 25, 74, 24, 72, 91, 35, 86, 19, 75, 58, 71, 47, 76, 59, 64, 93, 17, 50, 56, 94, 90, 89, 32, 37, 34, 65, 1, 73, 41, 36, 57, 77, 30, 22, 13, 29, 38, 16, 88, 61, 31, 85, 33, 54];
        
        integers.sortWithQuickSort()
        
        print("\(integers)")
    }
}

extension Array where Element: Comparable {
    public mutating func sortWithQuickSort() {
        sortBetween(0, self.count-1)
    }
    
    private mutating func sortBetween(_ start: Int, _ end: Int) {
        if end - start < 1 { return }
        
        var pivot = choosePivotBetween(start, end)
        
        pivot = partitionAroundPivot(pivot, start, end)
        
        sortBetween(start, pivot-1)
        sortBetween(pivot+1, end)
    }
    
    func choosePivotBetween(_ begin: Int, _ end: Int) -> Int {
        let randomPivot = begin + Int(arc4random_uniform(UInt32(end - begin)))
        //print("Pivot choice: \(randomPivot)")
        
        return randomPivot
    }
    
    mutating func partitionAroundPivot(_ pivot: Int, _ start: Int, _ end: Int) -> Int {
        if start != pivot {
            swap(&self[start], &self[pivot])
        }
        
        var pivotIndex = start
        let pivotValue = self[start]
        
        for index in start + 1...end {
            if self[index] < pivotValue {
                pivotIndex += 1
                if index != pivotIndex {
                    swap(&self[index], &self[pivotIndex])
                }
            }
        }
        
        if pivotIndex != start {
            swap(&self[pivotIndex], &self[start])
        }
        
        return pivotIndex
    }
}


