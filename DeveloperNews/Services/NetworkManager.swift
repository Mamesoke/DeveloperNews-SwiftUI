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
    
    func fetchData(_ completion: @escaping ([NewModel]) -> Void) {
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
                        DispatchQueue.main.async {
                            completion( newsRetrieved.map { (myElement) -> NewModel in myElement.value }.sort() )
                        }
                    }
                }
            }
            else {
                print("No data available")
            }
        }
    }
}
