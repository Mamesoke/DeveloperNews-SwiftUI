//
//  ContentViewTests.swift
//  DeveloperNewsTests
//
//  Created by Kevin Menéndez on 14/5/21.
//

import XCTest
import SwiftUI

class ContentViewTests: XCTestCase {
    var contentView: ContentView!
    var newViewModelMock: NewsViewModelMock!

    override func setUpWithError() throws {
        newViewModelMock = NewsViewModelMock()
        contentView = ContentView(newViewModelMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
