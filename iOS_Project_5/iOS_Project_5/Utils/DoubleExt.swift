//
//  DoubleExt.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 09/01/2024.
//

import Foundation

extension Double {
    func roundDecimal(places: Int = 2) -> String {
        if self == Double(Int(self)) {
            return "\(Int(self))"
        } else {
            let multiplier = pow(10.0, Double(places))
            let doubleNumber = self
            let integerPart = Int(doubleNumber)
            let decimalPart = Int(doubleNumber * multiplier) % Int(multiplier)
            let combinedString = "\(integerPart).\(decimalPart)"
            return combinedString
        }
    }
}
