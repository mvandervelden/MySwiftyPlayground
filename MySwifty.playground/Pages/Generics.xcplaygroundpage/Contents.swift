//: [Previous](@previous)

import Foundation

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

// Given this method exists or not, does it change which function is called on the elements? Yes
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
