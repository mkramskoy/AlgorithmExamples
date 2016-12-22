import Foundation

class MergeSort {
    
    class func run() {
        
        let integers = [4, 80, 70, 23, 9, 60, 68, 27, 66, 78, 12, 40, 52, 53, 44, 8, 49, 28, 18, 46, 21, 39, 51, 7, 87, 99, 69, 62, 84, 6, 79, 67, 14, 98, 83, 0, 96, 5, 82, 10, 26, 48, 3, 2, 15, 92, 11, 55, 63, 97, 43, 45, 81, 42, 95, 20, 25, 74, 24, 72, 91, 35, 86, 19, 75, 58, 71, 47, 76, 59, 64, 93, 17, 50, 56, 94, 90, 89, 32, 37, 34, 65, 1, 73, 41, 36, 57, 77, 30, 22, 13, 29, 38, 16, 88, 61, 31, 85, 33, 54]
        
        //let integers = [2, 1, 3, 1, 2]
        
        var numberOfInverses = 0
        let result = mergeSort(array: integers, numberOfInverses: &numberOfInverses)

        print("Sorted array:\n\(result)\n")
        print("Number of inverses = \n\(numberOfInverses)")
    }
    
    class func mergeSort(array: [Int], numberOfInverses:inout Int) -> [Int] {
        
        guard array.count > 1 else {
            return array
        }
        
        let middleIndex = array.count/2
        var leftPart = Array(array[0..<middleIndex])
        var rightPart = Array(array[middleIndex..<array.count])
        
        leftPart = mergeSort(array: leftPart, numberOfInverses: &numberOfInverses)
        rightPart = mergeSort(array: rightPart, numberOfInverses: &numberOfInverses)
        
        let mergeResult = merge(leftPart: leftPart, rightPart: rightPart, numberOfInverses: &numberOfInverses)
        
        return mergeResult
    }
    
    class func merge(leftPart: [Int], rightPart: [Int], numberOfInverses:inout Int) -> [Int] {
        
        print("leftPart:\n\(leftPart)\n")
        print("rightPart:\n\(rightPart)\n")
        
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedPile = [Int]()
        
        while leftIndex  < leftPart.count &&
            rightIndex < rightPart.count
        {
            if leftPart[leftIndex] < rightPart[rightIndex] {
                orderedPile.append(leftPart[leftIndex])
                leftIndex += 1
            }
            else if leftPart[leftIndex] > rightPart[rightIndex] {
                orderedPile.append(rightPart[rightIndex])
                rightIndex += 1
                
                numberOfInverses += leftPart.count - leftIndex
            }
            else {
                orderedPile.append(leftPart[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPart[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < leftPart.count {
            orderedPile.append(leftPart[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPart.count {
            orderedPile.append(rightPart[rightIndex])
            rightIndex += 1
        }
        
        print("Number of inverses = \n\(numberOfInverses)")
        
        return orderedPile
    }
}



