//
//  NewsViewModelTests.swift
//  DeveloperNewsTests
//
//  Created by Kevin Menéndez on 25/5/21.
//

import XCTest

class NewsViewModelTests: XCTestCase {
    var newsViewModel: NewsViewModel?

    override func setUpWithError() throws {
        newsViewModel = NewsViewModel()
    }

    override func tearDownWithError() throws {
        newsViewModel = nil
    }

    func testInvertedSortList() throws {
        let value1 = NewsValue(boolLittleImage: true,
                                 date: "May 20, 2021",
                                 newsDescription: "Test description 1",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 1")
        let value2 = NewsValue(boolLittleImage: true,
                                 date: "May 21, 2021",
                                 newsDescription: "Test description 2",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 2")
        
        let newsValues: [NewsValue] = [value1, value2]
        
        newsViewModel?.newsValues = newsValues
        newsViewModel?.invertSortList()
        
        guard let sortedAsc = newsViewModel?.sortedAsc else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(sortedAsc)
        XCTAssertEqual(newsViewModel!.renderValues.first?.date, value1.date)
        
        newsViewModel?.invertSortList()
        
        XCTAssertTrue(sortedAsc)
        XCTAssertEqual(newsViewModel!.renderValues.first?.date, value2.date)
    }

    func testFilter() {
        let value1 = NewsValue(boolLittleImage: true,
                                 date: "May 20, 2021",
                                 newsDescription: "Test description 1",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 1")
        let value2 = NewsValue(boolLittleImage: true,
                                 date: "May 21, 2021",
                                 newsDescription: "Test description 2",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 2")
        
        let newsValues: [NewsValue] = [value1, value2]
        
        newsViewModel?.newsValues = newsValues
        
        let result = newsViewModel?.filter(by: "Test 2")
        XCTAssertEqual(result?.first?.date, value2.date)
        XCTAssertTrue(result!.count == 1)
    }
    
    func testFilterEmpty() {
        let value1 = NewsValue(boolLittleImage: true,
                                 date: "May 20, 2021",
                                 newsDescription: "Test description 1",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 1")
        let value2 = NewsValue(boolLittleImage: true,
                                 date: "May 21, 2021",
                                 newsDescription: "Test description 2",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 2")
        
        let newsValues: [NewsValue] = [value1, value2]
        
        newsViewModel?.newsValues = newsValues
        
        let result = newsViewModel?.filter(by: "")
        XCTAssertTrue(result!.count == 2)
    }
}
