
import UIKit


func quickSort(_ array: [Int], pivotChoice: PivotChoiceType, numberOfComparisons: inout Int) -> [Int] {
    
    guard array.count > 1 else {
        return array
    }
    
    let pivotIndex = choosePivot(array, pivotChoice: pivotChoice)
    let partitionResult = partitionAroundPivot(pivotIndex, array: array)
    
    // no need to count all comparisons in partitioning routine,
    // as it will always be equal to input array size - 1 (pivot element isn't compared to itself)
    numberOfComparisons += array.count - 1
    
    var sortedArray = [Int]()
    sortedArray.append(contentsOf: quickSort(partitionResult.leftPart, pivotChoice: pivotChoice, numberOfComparisons: &numberOfComparisons))
    sortedArray.append(partitionResult.pivot)
    sortedArray.append(contentsOf: quickSort(partitionResult.rightPart, pivotChoice: pivotChoice, numberOfComparisons: &numberOfComparisons))
    
    return sortedArray
}

enum PivotChoiceType {
    case firstElement
    case lastElement
    case median
    case random
}

func choosePivot(_ array: [Int], pivotChoice: PivotChoiceType) -> Int {
    
    switch pivotChoice {
    case .firstElement:
        return 0
    case .lastElement:
        return array.count - 1
    case .median:
        let firstElement = array[0]
        let middleElement = array[(array.count - 1)/2]
        let lastElement = array[array.count - 1]
        
        let median = max(min(firstElement, middleElement), min(max(firstElement,middleElement),lastElement))
        return array.index(of: median)!
        
    case .random:
        return Int(arc4random_uniform(UInt32(array.count)))
    }
}

func partitionAroundPivot(_ pivotIndex: Int, array: [Int]) -> (leftPart: [Int], rightPart: [Int], pivot:Int) {
    
    var partitionedArray = array
    (partitionedArray[0], partitionedArray[pivotIndex]) = (partitionedArray[pivotIndex], partitionedArray[0])
    
    var i = 1
    for j in 0..<array.count {
        if partitionedArray[j] < partitionedArray[0] {
            (partitionedArray[i], partitionedArray[j]) = (partitionedArray[j], partitionedArray[i])
            i += 1
        }
    }
    
    (partitionedArray[0], partitionedArray[i-1]) = (partitionedArray[i-1], partitionedArray[0])
    
    let leftPart = Array(partitionedArray[0..<i-1])
    let rightPart = Array(partitionedArray[i..<partitionedArray.count])
    
    return (leftPart: leftPart, rightPart: rightPart, pivot: partitionedArray[i-1])
}


//let unsortedArray = [57,97,17,31,54,98,87,27,89,81,18,70,3,34,63,100,46,30,99,10,33,65,96,38,48,80,95,6,16,19,56,61,1,47,12,73,49,41,37,40,59,67,93,26,75,44,58,66,8,55,94,74,83,7,15,86,42,50,5,22,90,13,69,53,43,24,92,51,23,39,78,85,4,25,52,36,60,68,9,64,79,14,45,2,77,84,11,71,35,72,28,76,82,88,32,21,20,91,62,29]
let unsortedArray = [3,9,8,4,6,10,2,5,7,1]

var numberOfComparisons = 0
let sortedArray = quickSort(unsortedArray, pivotChoice:.median, numberOfComparisons: &numberOfComparisons)

print("\(numberOfComparisons)")
print("\(sortedArray)")


