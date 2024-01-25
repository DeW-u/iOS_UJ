//
//  FunctionsToTest.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 26/01/2024.
//

import Foundation

func sum(x1: Int, x2: Int) -> Int {
    return x1+x2
}

func sum(x1: Float, x2: Float) -> Float {
    return x1+x2
}

func sum(x1: Double, x2: Double) -> Double {
    return x1+x2
}

func minus(x1: Int, x2: Int) -> Int {
    return x1 - x2
}

func minus(x1: Float, x2: Float) -> Float {
    return x1 - x2
}

func minus(x1: Double, x2: Double) -> Double {
    return x1 - x2
}

func multiply(x1: Int, x2: Int) -> Int {
    return x1*x2
}

func multiply(x1: Float, x2: Float) -> Float {
    return x1*x2
}

func multiply(x1: Double, x2: Double) -> Double {
    return x1*x2
}

func divide(x1: Int, x2: Int) -> Int {
    return x1/x2
}

func divide(x1: Float, x2: Float) -> Float {
    return x1/x2
}

func divide(x1: Double, x2: Double) -> Double {
    return x1/x2
}

func modulo(x1: Int, x2: Int) -> Int {
    return x1 % x2
}

func fibonacci(n: Int) -> Int {

    var num1 = 0
    var num2 = 1
    
    if n == 0 {
        return 0
    }

    for _ in 1 ..< n {
    
        let num = num1 + num2
        num1 = num2
        num2 = num
    }
    
    return num2
}
