//
//  DoubleExt.swift
//  iOS_Project_4
//
//  Created by Daniel Latos on 09/01/2024.
//

import Foundation

extension Double {
    func roundDecimal(places: Int = 2) -> String {
        if places < 0 {
            return "Places in rounding cannot be lesser than 0"
        }
        
        if self == Double(Int(self)) {
            return "\(Int(self))"
        } else {
            let multiplier = pow(10.0, Double(places))
            let doubleNumber = (self * multiplier).rounded(.toNearestOrEven) / multiplier
            let integerPart = Int(doubleNumber)
            let decimalPart = Int(doubleNumber * multiplier) % Int(multiplier)
            
            let combinedString = if decimalPart == 0 {
                "\(integerPart)"
            } else {
                "\(integerPart).\(decimalPart)"
            }
            
            return combinedString
        }
    }
}
