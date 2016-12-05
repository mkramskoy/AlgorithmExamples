import Foundation

class MergeSort {
    
    class func mergeSort<T:Comparable>(_ array: Array<T>) -> Array<T> {
        if array.count == 1 {
            return array
        }
        
        let index = array.count/2
        var firstPart = mergeSort(Array(array[0...index-1]))
        var secondPart = mergeSort(Array(array[index...array.count-1]))
        
        func merge(_ leftPart: Array<T>, _ rightPart: Array<T>) -> Array<T> {
            
            var mergedArray = Array<T>()
            
            var indexOfLeftPart = 0
            var indexOfRightPart = 0
            
            while indexOfLeftPart < leftPart.count && indexOfRightPart < rightPart.count {
                
                let leftElement = leftPart[indexOfLeftPart]
                let rightElement = rightPart[indexOfRightPart]
                
                if leftElement < rightElement {
                    mergedArray.append(leftElement)
                    indexOfLeftPart += 1
                }
                else if leftElement > rightElement {
                    mergedArray.append(rightElement)
                    indexOfRightPart += 1
                }
                else {
                    mergedArray.append(leftElement)
                    mergedArray.append(rightElement)
                    indexOfLeftPart += 1
                    indexOfRightPart += 1
                }
            }
            
            while indexOfLeftPart != leftPart.count {
                mergedArray.append(leftPart[indexOfLeftPart])
                indexOfLeftPart += 1
            }
            
            while indexOfRightPart != rightPart.count {
                mergedArray.append(rightPart[indexOfRightPart])
                indexOfRightPart += 1
            }
            
            return mergedArray
        }
        
        return merge(firstPart, secondPart)
    }
}



