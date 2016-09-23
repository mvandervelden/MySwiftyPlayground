//: Playground - noun: a place where people can play

import Foundation


let array = [8,3,5,2,8,4]

//: Classic reverse
var reversedArray = [Int]()
for index in stride(from: array.count-1, through: 0, by: -1) {
    reversedArray.append(array[index])
}
reversedArray

//: Functional reverse
array.reduce([]) { (result, val) -> [Int] in
    [val] + result
}
//: Shorthand, not very readable
let fRev = array.reduce([]) { [$1] + $0 }
fRev

//: Quicksort
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

quickSort(array: reversedArray)

//: Bubblesort
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

bubbleSort(array: reversedArray)

//: Functional max
array.reduce(0) { (result, val) -> Int in
    max(result, val)
}

//: Functional even values
array.filter { $0 % 2 == 0 }

//: even index
array.enumerated().filter { (offset, _) -> Bool in
    offset % 2 == 0
}.map { (_, element) -> Int in
    element
}

//: shorthand
let fEven = array
    .enumerated()
    .filter { $0.offset % 2 == 0 }
    .map { $0.element }
fEven

//: running total
array.reduce([0]) { (result, int) in
    result + [result.last! + int]
}.dropFirst()

//: total
let fTotal = array.reduce(0) {  $0 + $1 }
fTotal


// Function onAll, generic using map
func on<T>(all array: [T], perform function:(_ element:T) -> T ) -> [T] {
    return array.map(function)
}

// onAll with anonymous function
let fDouble = on(all: array) { $0 * 2 }
fDouble

// onAll with named function
func squared(val: Int) -> Int {
    return val * val
}
on(all: array, perform: squared)


//: [Next](@next)

