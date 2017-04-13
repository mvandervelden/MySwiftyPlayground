/*:

 Functional programming finger food

 */

import Foundation

let array = [8,3,5,2,8,4]

var adder: (String, Int) -> String = { (result, value) -> String in
    dump(result)
    print(value)
    return result + "\(value)"
}

array.reduce(0, +)


//: Reverse array
array.reduce([]) { (result, val) -> [Int] in
    [val] + result
}

//: Shorthand, not very readable
let reverse = array.reduce([]) { [$1] + $0 }
reverse

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
let even = array
    .enumerated()
    .filter { $0.offset % 2 == 0 }
    .map { $0.element }
even

//: Running total
array.reduce([0]) { (result, int) in
    result + [result.last! + int]
}.dropFirst()

//: Non-running Total
let total = array.reduce(0) {  $0 + $1 }
total

//: onAll, generic, using map
func on<T, U>(all array: [T], perform function:(_ element:T) -> U ) -> [U] {
    return array.map(function)
}

//: Call onAll with anonymous function
let times2 = on(all: array) { $0 * 2 }
times2

//: onAll with named function
func squared(val: Int) -> Int {
    return val * val
}
on(all: array, perform: squared)

//: [Next](@next)
