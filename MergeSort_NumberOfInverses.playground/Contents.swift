
func mergeSort(array: [Int]) -> (sortedArray:[Int], inverseNumbers:Int) {
    
    guard array.count > 1 else {
        return (array, 0)
    }
    
    let middleIndex = array.count/2
    let leftPart = mergeSort(Array(array[0..<middleIndex]))
    let rightPart = mergeSort(Array(array[middleIndex..<array.count]))
    
    let mergeResult = mergeAndCountInverse(leftPart: leftPart.sortedArray, rightPart: rightPart.sortedArray)
    
    let inverseNumber = leftPart.inverseNumbers + rightPart.inverseNumbers + mergeResult.inverseNumbers
    
    return (sortedArray:mergeResult.sortedArray, inverseNumbers:inverseNumber)
}

func mergeAndCountInverse(leftPart leftPart: [Int], rightPart: [Int]) -> (sortedArray:[Int], inverseNumbers:Int) {
    
    var leftIndex = 0
    var rightIndex = 0
    var inverseNumbers = 0
    
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
            
            inverseNumbers += leftPart.count - leftIndex
        }
        else {
            orderedPile.append(leftPart[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPart[rightIndex])
            rightIndex += 1
            print("numbers are equal")
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
    
    return (sortedArray:orderedPile, inverseNumbers:inverseNumbers)
}

var integers = [4, 80, 70, 23, 9, 60, 68, 27, 66, 78, 12, 40, 52, 53, 44, 8, 49, 28, 18, 46, 21, 39, 51, 7, 87, 99, 69, 62, 84, 6, 79, 67, 14, 98, 83, 0, 96, 5, 82, 10, 26, 48, 3, 2, 15, 92, 11, 55, 63, 97, 43, 45, 81, 42, 95, 20, 25, 74, 24, 72, 91, 35, 86, 19, 75, 58, 71, 47, 76, 59, 64, 93, 17, 50, 56, 94, 90, 89, 32, 37, 34, 65, 1, 73, 41, 36, 57, 77, 30, 22, 13, 29, 38, 16, 88, 61, 31, 85, 33, 54]

let result = mergeSort(integers)
let inverseNumber = result.inverseNumbers


