/*: 
 
 How to combine the array 1 2 3 4 5 6 7 8 9 into an equation that results in 100, using operation '1+2', '1-2' and '12'?
 Find all results
 
 */

//: [Previous](@previous)

import Foundation

let expectedResult = 100
let ingredients = [1, 2, 3, 4, 5, 6, 7, 8, 9]

typealias Equation = String

struct PartialEquation : CustomStringConvertible {
    let value: Int
    let equation: Equation
    var description: String {
        get {
            return "\(equation) = \(value)"
        }
    }
}

enum SearchOperation : String {
    case plus = "+"
    case minus = "-"
    case cat = ""
    
    func execute(_ i1: Int, _ i2: Int) -> Int {
        switch self {
        case .plus:
            return i1 + i2
        case .minus:
            return i1 - i2
        case .cat:
            return i1 * 10 + i2
        }
    }
    
    func describe(_ equation: Equation, with value: String) -> String {
        return equation + rawValue + value
    }
}

func combine(partial result: PartialEquation, and next:Int, with nextRemainder: [Int]) -> [PartialEquation] {
    return [SearchOperation.plus, .minus, .cat].flatMap { (operation) -> [PartialEquation] in
        let nextPartialResult = PartialEquation(value: operation.execute(result.value, next), equation: operation.describe(result.equation, with: next.description))
        return combine(partial: nextPartialResult, with: nextRemainder)
    }
}

func combine(partial result: PartialEquation, with remainder: [Int]) -> [PartialEquation] {
    if let next = remainder.first {
        return combine(partial: result, and: next, with: Array(remainder.dropFirst()))
    } else if result.value == expectedResult {
        return [result]
    } else {
        return []
    }
}

func findCombo(with array:[Int]) -> [String] {
    return combine(partial: PartialEquation(value:array[0], equation: array[0].description), with: Array(array.dropFirst())).map { $0.description }
}

findCombo(with: ingredients)

//: [Next](@next)
