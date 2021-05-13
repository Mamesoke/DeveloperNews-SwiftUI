//
//  NewsViewModel.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 9/5/21.
//

import Foundation
import Firebase

class NewsViewModel: ObservableObject {
    @Published var newList = [NewsValue]()
    
    func retrieveAll(_ news: News) -> [NewsValue] {
        var result: [NewsValue] = []
        for (key, value) in news {
            result.append(value)
        }
        
        return result
    }
    
    private let collectionName = "apple-news"
    private var db = Database.database().reference()
    
    
    func fetchData() {
        db.child(collectionName).getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
                let doc = snapshot
                
                guard error == nil, doc.exists() == true, let dict = doc.value else {
                  print(error)
                  return
                }

                if let data = try?  JSONSerialization.data(withJSONObject: dict, options: []) {
                    let newsRetrieved = try? newJSONDecoder().decode(News.self, from: data)
                    if let newsRetrieved = newsRetrieved {
                        self.newList = self.retrieveAll(newsRetrieved)
                        Analytics.logEvent("fetch_data", parameters: [
                            "records": self.newList.count as NSObject
                          ])
                    }
                }
            }
            else {
                print("No data available")
            }
        }
    }
}

class NewsViewModelMock: NewsViewModel {
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
            super.newList.append(newElement)
        }
    }
    
    override func fetchData() {
        print("Simulate fetchData")
    }
}


