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
    
    private mutating func sortBetween(_ startIndex: Int, _ endIndex: Int) {
        
        if endIndex - startIndex <= 1 { return }
        
        var pivot = startIndex // just a random pivot choice
        
        pivot = partitionAroundPivot(pivot, startIndex, endIndex)
        
        sortBetween(startIndex, pivot-1)
        sortBetween(pivot+1, endIndex)
    }
    
    private mutating func partitionAroundPivot(_ pivot: Int, _ startIndex: Int, _ endIndex: Int) -> Int {
        
        if startIndex != pivot {
            swap(&self[startIndex], &self[pivot])
        }
        
        var pivotIndex = startIndex
        let pivotValue = self[startIndex]
        
        for index in startIndex + 1...endIndex {
            if self[index] < pivotValue {
                pivotIndex += 1
                if index != pivotIndex {
                    swap(&self[index], &self[pivotIndex])
                }
            }
        }
        
        if pivotIndex != startIndex {
            swap(&self[pivotIndex], &self[startIndex])
        }
        
        return pivotIndex
    }
}


