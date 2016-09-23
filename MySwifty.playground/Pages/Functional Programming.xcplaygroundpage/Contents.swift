//: Functional programming finger food

import Foundation

let array = [8,3,5,2,8,4]

//: Reverse array
array.reduce([]) { (result, val) -> [Int] in
    [val] + result
}

//: Shorthand, not very readable
let fRev = array.reduce([]) { [$1] + $0 }
fRev


//: Max
array.reduce(0) { (result, val) -> Int in
    max(result, val)
}

//: Even values
array.filter { $0 % 2 == 0 }

//: Even indexes
array.enumerated().filter { (offset, _) -> Bool in
    offset % 2 == 0
}.map { (_, element) -> Int in
    element
}

//: Shorthand, this time it reads kinda nice
let fEven = array
    .enumerated()
    .filter { $0.offset % 2 == 0 }
    .map { $0.element }
fEven

//: Running total
array.reduce([0]) { (result, int) in
    result + [result.last! + int]
}.dropFirst()

//: Non-running Total
let fTotal = array.reduce(0) {  $0 + $1 }
fTotal


//: onAll, generic, using map
func on<T>(all array: [T], perform function:(_ element:T) -> T ) -> [T] {
    return array.map(function)
}

//: Call onAll with anonymous function
let fDouble = on(all: array) { $0 * 2 }
fDouble

//: onAll with named function
func squared(val: Int) -> Int {
    return val * val
}
on(all: array, perform: squared)


//: [Next](@next)

