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
    
    private let collectionName = "apple-news-dummy"
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
                    }
                }
            }
            else {
                print("No data available")
            }
        }
    }
}


