//: Some algorithms for breakfast

//: [Previous](@previous)

import Foundation

let array = [8,3,5,2,8,4]


//: Quicksort, recursive as I like them best
func quickSort<T: Comparable>(array: [T]) -> [T] {
    if array.count > 1 {
        var array = array
        let pivot = array.remove(at: 0)
        let firstPart = quickSort(array: array.filter {$0 <= pivot})
        let secondPart = quickSort(array: array.filter {$0 > pivot})
        return firstPart + [pivot] + secondPart
    }
    return array
}

quickSort(array: array)

//: Bubblesort, not so nice
func bubbleSort<T: Comparable>(array: [T]) -> [T] {
    var array = array
    var swapped = false
    repeat {
        swapped = false
        for (index, element) in array.enumerated() {
            if index < array.count - 1 && element > array[index+1] {
                array[index] = array[index+1]
                array[index+1] = element
                swapped = true
            }
        }
    } while swapped == true
    return array
}

bubbleSort(array: array)


//: [Next](@next)
