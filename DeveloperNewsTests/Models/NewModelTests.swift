//
//  NewModelTests.swift
//  DeveloperNewsTests
//
//  Created by Kevin Menéndez on 4/6/21.
//

import XCTest

class NewModelTests: XCTestCase {
    var newsValues: [NewModel]!
    
    var value1: NewModel!
    var value2: NewModel!

    override func setUpWithError() throws {
        value1 = NewModel(boolLittleImage: true,
                                 date: "May 20, 2021",
                                 newsDescription: "Test description 1",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 1")
        value2 = NewModel(boolLittleImage: true,
                                 date: "May 21, 2021",
                                 newsDescription: "Test description 2",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 2")
        
        newsValues = [value1, value2]
    }

    override func tearDownWithError() throws {
        value1 = nil
        value2 = nil
        newsValues = nil
    }
    

    func testFilter() {
        let result = newsValues.filter(by: "Test 2")
        XCTAssertEqual(result.first?.date, value2.date)
        XCTAssertTrue(result.count == 1)
    }
    
    func testFilterEmpty() {
        let result = newsValues.filter(by: "")
        XCTAssertTrue(result.count == 2)
    }

    
    func testSortInvertNewModel() throws {
        XCTAssertEqual(newsValues.first?.date, value1.date)
        
        let invertedNewsValues = newsValues.sort(ascendent: false)
        
        XCTAssertEqual(invertedNewsValues.first?.date, value2.date)
    }
    
    
    func testSortNewModel() throws {
        XCTAssertEqual(newsValues.first?.date, value1.date)
        
        let sortedNewsValues = newsValues.sort(ascendent: true)
        
        XCTAssertEqual(sortedNewsValues.first?.date, value1.date)
    }
}
