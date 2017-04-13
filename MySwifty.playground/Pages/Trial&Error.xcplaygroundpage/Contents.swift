//: [Previous](@previous)

import Foundation

let y: UInt32 = 0xFF
let yy = y << 16
String(format:"%X", yy)
let x = 0xFF00
String(format:"%X", x)


let id = 0
let id2 = 111

let hash1 = id + 1 << 32
let hash2 = id2 + 1 << 32
let hash3 = id + (1 << 16)
let hash4 = id2 + 1 << 16


protocol P {
}

class Foo: P {

}

class Boo: P {

}

class Bar {
    func doSomething() {
        call([Foo()])
        call([Boo()])
    }

//    private func call(_ element: [Foo]) {
//        print("Foo called")
//        element.forEach { call($0) }
//    }

    private func call(_ element: [P]) {
        print("Gen called")
        element.forEach { call($0) }
    }

    private func call(_ element: Foo) {
        print("Foo callcalled")
    }

    private func call(_ element: P) {
        print("Gen callcalled")
    }
}

Bar().doSomething()

//: [Next](@next)
