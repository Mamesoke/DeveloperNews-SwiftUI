//
//  NewsViewModelTests.swift
//  DeveloperNewsTests
//
//  Created by Kevin Menéndez on 25/5/21.
//

import XCTest

class NewsViewModelTests: XCTestCase {
    var newsViewModel: NewsViewModel!

    override func setUpWithError() throws {
        newsViewModel = NewsViewModel()
    }

    override func tearDownWithError() throws {
        newsViewModel = nil
    }

    
    func testInvertSortList() throws {
        XCTAssertFalse(self.newsViewModel.sortedAsc)
        
        self.newsViewModel.invertSortList()
        
        XCTAssertTrue(self.newsViewModel.sortedAsc)
    }
    
    func testInvertSortListWhenIsFiltered() throws {
        XCTAssertFalse(self.newsViewModel.sortedAsc)
        
        self.newsViewModel.isFiltered = true
        self.newsViewModel.invertSortList()
        
        XCTAssertTrue(self.newsViewModel.sortedAsc)
    }
    
    func testResetList() throws {
        let value1 = NewModel(boolLittleImage: true,
                                 date: "May 20, 2021",
                                 newsDescription: "Test description 1",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 1")
        let value2 = NewModel(boolLittleImage: true,
                                 date: "May 21, 2021",
                                 newsDescription: "Test description 2",
                                 image: "",
                                 linkNew: "",
                                 title: "Test 2")
        
        let newsValues: [NewModel] = [value1, value2]
        
        self.newsViewModel.renderValues = newsValues
        XCTAssertTrue(self.newsViewModel.renderValues.count == 2)
        
        self.newsViewModel.resetList()
        XCTAssertTrue(self.newsViewModel.renderValues.count == 0)
    }
}
