//
//  NewViewModelMock.swift
//  DeveloperNewsTests
//
//  Created by Kevin Menéndez on 14/5/21.
//

class NewsViewModelMock: NewsViewModel {
    var fetchDataIsCalled = false
    
    override init() {
        super.init()
        for index in 1...10 {
            var littleImage = true
            var image = "https://developer.apple.com/assets/elements/icons/app-store/app-store-128x128_2x.png"
            if index == 3 {
                littleImage = false
                image = "https://devimages-cdn.apple.com/wwdc-services/articles/images/CDF342DD-530D-4FD9-ACB4-D2B1C893933B/2048.jpeg"
            }
            let newElement = NewsValue(boolLittleImage: littleImage,
                                       date: "\(index) June",
                                       newsDescription: "This is a mock description \(index)",
                                       image: image,
                                       linkNew: "emptyLink \(index)",
                                       title: "Title test \(index)")
            
            super.renderValues.append(newElement)
        }
    }
    
    override func fetchData() {
        self.fetchDataIsCalled = true
        print("Simulate fetchData")
    }
}
