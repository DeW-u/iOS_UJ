//
//  DoubleExtTests.swift
//  iOS_Project_Tests
//
//  Created by Daniel Latos on 25/01/2024.
//

import XCTest
@testable import iOS_Project_5

final class DoubleExtTests: XCTestCase {

    func testSuccessfulRoundDecimalDefault() {
        let exampleDouble = 3.141593
        
        let roundedNumberTo2Places = exampleDouble.roundDecimal()
        
        XCTAssertEqual(roundedNumberTo2Places, "3.14")
    }
    
    func testSuccessfulRoundDecimalCustomPlaces() {
        let exampleDouble = 3.141593
        
        let customPlacesNumber = 4
        
        let roundedNumberToCustomPlaces = exampleDouble.roundDecimal(places: customPlacesNumber)
        
        XCTAssertEqual(roundedNumberToCustomPlaces, "3.1416")
    }
    
    func testSuccessfulRoundDecimalMoreThanGivenPlaces() {
        let exampleDouble = 3.141593
        
        let customPlacesNumber = 8
        
        let roundedNumberToCustomPlaces = exampleDouble.roundDecimal(places: customPlacesNumber)
        
        XCTAssertEqual(roundedNumberToCustomPlaces, "3.14159300")
    }
    
    func testSuccessfulRoundDecimalZeroPlaces() {
        let exampleDouble = 3.141593
        
        let customPlacesNumber = 0
        
        let roundedNumberToCustomPlaces = exampleDouble.roundDecimal(places: customPlacesNumber)
        
        XCTAssertEqual(roundedNumberToCustomPlaces, "3")
    }
    
    func testSuccessfulRoundDecimalMinusPlaces() {
        let exampleDouble = 3.141593
        
        let customPlacesNumber = -1
        
        let roundedNumberToCustomPlaces = exampleDouble.roundDecimal(places: customPlacesNumber)
        
        XCTAssertEqual(roundedNumberToCustomPlaces, "Places in rounding cannot be lesser than 0")
    }
}
