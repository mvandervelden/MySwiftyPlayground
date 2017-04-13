//: [Previous](@previous)

import Foundation
import UIKit

@objc protocol SomeProtocol {
    func someString() -> NSString
}

class SomeClass: SomeProtocol {
    func someString() -> NSString {
        return "Hi" as NSString
    }
}


SomeClass().someString()

protocol Mockable {
    func didCall(methodString: String) -> Bool
}

class MockClass: SomeProtocol, Mockable {
    private var didCallDescription = false
    
    internal func someString() -> NSString {
        return "Mocked" as NSString
    }

    func didCall(methodString: String) -> Bool {
        return didCallDescription
    }
    
    func didCall(method: Method) -> Bool {
        return didCallDescription
    }
}

let testedMock = MockClass()
testedMock.someString()
testedMock.didCall(methodString: "description()")

func extractMethodFrom(owner: AnyObject, selector: Selector) -> (() -> NSString)? {
    print(owner)
    print(selector)
    let method: Method?
    if owner is AnyClass {
        method = class_getClassMethod(owner as! AnyClass, selector)
    } else {
        method = class_getInstanceMethod(type(of: owner), selector)
    }
    let implementation = method_getImplementation(method)
    
    typealias Function = @convention(c) (AnyObject, Selector) -> Unmanaged<NSString>
    let function = unsafeBitCast(implementation, to: Function.self)
    
    return {
        print(function)
        
        return function(owner, selector).takeUnretainedValue()
    }
}

let name = #selector(SomeProtocol.someString) // e.g. from somewhere else

if let method = extractMethodFrom(owner: SomeClass(), selector: name) {
    let number: NSString = method()
    // Use image here
}

//: [Next](@next)
