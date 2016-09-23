//: [Previous](@previous)

import Foundation

let expectedResult = 100
let ingredients = [1, 2, 3, 4, 5, 6, 7, 8, 9]

typealias Equation = String

struct TResult : CustomStringConvertible {
    let value: Int
    let equation: Equation
    var description: String {
        get {
            return "\(equation) = \(value)"
        }
    }
}

enum Operations : String {
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

func combine(partial result: TResult, and next:Int, with nextRemainder: [Int]) -> [TResult] {
    return [Operations.plus, .minus, .cat].flatMap { (operation) -> [TResult] in
        let nextPartialResult = TResult(value: operation.execute(result.value, next), equation: operation.describe(result.equation, with: next.description))
        return combine(partial: nextPartialResult, with: nextRemainder)
    }
}

func combine(partial result: TResult, with remainder: [Int]) -> [TResult] {
    if let next = remainder.first {
        return combine(partial: result, and: next, with: Array(remainder.dropFirst()))
    } else if result.value == expectedResult {
        return [result]
    } else {
        return []
    }
}

func findCombo(with array:[Int]) -> [String] {
    return combine(partial: TResult(value:array[0], equation: array[0].description), with: Array(array.dropFirst())).map { $0.description }
}

let results = findCombo(with: ingredients)
results

//: [Next](@next)
