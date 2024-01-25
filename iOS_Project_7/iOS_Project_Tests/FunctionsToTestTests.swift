//
//  FunctionsToTestTests.swift
//  iOS_Project_Tests
//
//  Created by Daniel Latos on 26/01/2024.
//

import XCTest
@testable import iOS_Project_5

final class FunctionsToTestTests: XCTestCase {
    
    func testIntegerSum() {
        XCTAssertEqual(sum(x1: 3, x2: 5), 8)
    }
    
    func testFloatSum() {
        XCTAssertEqual(sum(x1: 2.5, x2: 3.5), 6.0, accuracy: 0.001)
    }
    
    func testDoubleSum() {
        XCTAssertEqual(sum(x1: 2.5, x2: 3.5), 6.0, accuracy: 0.001)
    }
    
    func testIntegerMinus() {
        XCTAssertEqual(minus(x1: 8, x2: 3), 5)
    }
    
    func testFloatMinus() {
        XCTAssertEqual(minus(x1: 7.5, x2: 2.5), 5.0, accuracy: 0.001)
    }
    
    func testDoubleMinus() {
        XCTAssertEqual(minus(x1: 7.5, x2: 2.5), 5.0, accuracy: 0.001)
    }
    
    func testIntegerMultiply() {
        XCTAssertEqual(multiply(x1: 4, x2: 6), 24)
    }
    
    func testFloatMultiply() {
        XCTAssertEqual(multiply(x1: 2.5, x2: 3.5), 8.75, accuracy: 0.001)
    }
    
    func testDoubleMultiply() {
        XCTAssertEqual(multiply(x1: 2.5, x2: 3.5), 8.75, accuracy: 0.001)
    }
    
    func testIntegerDivide() {
        XCTAssertEqual(divide(x1: 8, x2: 2), 4)
    }
    
    func testFloatDivide() {
        XCTAssertEqual(divide(x1: 10.0, x2: 2.0), 5.0, accuracy: 0.001)
    }
    
    func testDoubleDivide() {
        XCTAssertEqual(divide(x1: 10.0, x2: 2.0), 5.0, accuracy: 0.001)
    }
    
    func testModuloPositiveNumbers() {
        XCTAssertEqual(modulo(x1: 10, x2: 3), 1)
    }
    
    func testModuloNegativeNumbers() {
        XCTAssertEqual(modulo(x1: -10, x2: 3), -1)
    }
    
    func testModuloZero() {
        XCTAssertEqual(modulo(x1: 0, x2: 5), 0)
    }
    
    func testFibonacciZero() {
        XCTAssertEqual(fibonacci(n: 0), 0)
    }
    
    func testFibonacciOne() {
        XCTAssertEqual(fibonacci(n: 1), 1)
    }
    
    func testFibonacciFive() {
        XCTAssertEqual(fibonacci(n: 5), 5)
    }
    
    func testFibonacciTen() {
        XCTAssertEqual(fibonacci(n: 10), 55)
    }
}
