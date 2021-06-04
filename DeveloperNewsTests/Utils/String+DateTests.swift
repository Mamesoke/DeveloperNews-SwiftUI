//
//  String+DateTests.swift
//  DeveloperNewsTests
//
//  Created by Kevin Menéndez on 4/6/21.
//

import XCTest
import Foundation

class String_DateTests: XCTestCase {

    func testConvertToDate() throws {
        let value = "May 11, 2020"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMM dd, yyyy"
        
        guard let date = dateFormatterGet.date(from: value) else {
            XCTFail()
            return
        }

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        
        let dateResult: Date = value.convertToDate()
        
        XCTAssertEqual(dateFormatterPrint.string(from: dateResult), "2020-05-11")
        XCTAssertEqual(dateResult, date)
        
    }
    
    func testConvertToDateBadFormat() throws {
        let value = "May 11, 202T"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        
        let dateResult: Date = value.convertToDate()
        XCTAssertEqual(dateFormatterPrint.string(from: dateResult), dateFormatterPrint.string(from: Date()))
        
    }

}
