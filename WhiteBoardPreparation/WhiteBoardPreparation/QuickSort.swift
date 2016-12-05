import Foundation

class QuickSort {
    class func quickSort<T: Comparable>(_ array: Array<T>) -> Array<T> {
        guard array.count > 1 else { return array }
        
        let pivot = array[array.count/2]
        
        let leftPart = array.filter() { $0 < pivot }
        let central = array.filter() { $0 == pivot }
        let rightPart = array.filter() { $0 > pivot }
        
        return quickSort(leftPart) + central + quickSort(rightPart)
    }
    class func quicksortRandom<T: Comparable>(a: inout [T], low: Int, high: Int) {
        if low < high {
            // Create a random pivot index in the range [low...high].
            let pivotIndex = random(min: low, max: high)
            // Because the Lomuto scheme expects a[high] to be the pivot entry, swap
            // a[pivotIndex] with a[high] to put the pivot element at the end.
            (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
            let p = partitionLomuto(a: &a, low: low, high: high)
            quicksortRandom(a: &a, low: low, high: p - 1)
            quicksortRandom(a: &a, low: p + 1, high: high)
        }
    }
    class func partitionLomuto<T: Comparable>(a: inout [T], low: Int, high: Int) -> Int {
        // We always use the highest item as the pivot.
        let pivot = a[high]
        
        // This loop partitions the array into four (possibly empty) regions:
        //   [low  ...      i] contains all values <= pivot,
        //   [i+1  ...    j-1] contains all values > pivot,
        //   [j    ... high-1] are values we haven't looked at yet,
        //   [high           ] is the pivot value.
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                (a[i], a[j]) = (a[j], a[i])
                i += 1
            }}
        // Swap the pivot element with the first element that is greater than
        // the pivot. Now the pivot sits between the <= and > regions and the
        // array is properly partitioned.
        (a[i], a[high]) = (a[high], a[i])
        return i
    }
    
    class func random(min: Int, max: Int) -> Int {
        assert(min < max)
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}


