//
//  NetworkManager.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 23/5/21.
//

import Foundation
import Firebase

enum DateError: Error {
    case decode(String)
}

class NetworkManager {
    private let collectionName = "apple-news"
    private var db = Database.database().reference()
    
    func fetchData(_ completion: @escaping ([NewsValue]) -> Void) {
        db.child(collectionName).getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
                let doc = snapshot
                
                guard error == nil, doc.exists() == true, let dict = doc.value else {
                    if let error = error {
                        print(error)
                    }
                  return
                }

                if let data = try?  JSONSerialization.data(withJSONObject: dict, options: []) {
                    let newsRetrieved = try? newJSONDecoder().decode(News.self, from: data)
                    if let newsRetrieved = newsRetrieved {
                        DispatchQueue.global(qos: .background).async {
                            let list = self.retrieveAll(newsRetrieved)
                            completion(self.sorted(list))
                        }
                    }
                }
            }
            else {
                print("No data available")
            }
        }
    }
    
    func retrieveAll(_ news: News) -> [NewsValue] {
        var result: [NewsValue] = []
        for (_, value) in news {
            result.append(value)
        }
        
        return result
    }
    
    func sorted(_ list: [NewsValue]) -> [NewsValue] {
        let orderList = list.sorted(by: { convertDateFromString($0.date) > convertDateFromString($1.date) })
        return orderList
    }
    
    func convertDateFromString(_ str: String) -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMM dd, yyyy"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"

        guard let date = dateFormatterGet.date(from: str) else {
            // throw DateError.decode("There was an error decoding the string")
            return Date()
        }
        // print(dateFormatterPrint.string(from: date))
        
        return date
    }
}
