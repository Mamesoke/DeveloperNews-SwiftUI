//
//  NewsViewModel.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 9/5/21.
//

import SwiftUI
import Firebase

class NewsViewModel: ObservableObject {
    @Published var newsValues = [NewsValue]()
    @Published var renderValues = [NewsValue]()
    var sortedAsc: Bool = false
    let networkManager: NetworkManager
    
    init() {
        networkManager = NetworkManager()
    }
    
    func fetchData() {
        networkManager.fetchData { (values) in
            self.newsValues = values
            self.renderValues = values
            
            Analytics.logEvent("fetch_data", parameters: [
                "records": self.newsValues.count as NSObject
              ])
        }
    }
    
    func invertSortList() {
        sortedAsc = !sortedAsc
        self.renderValues = self.sorted(self.newsValues, ascendent: sortedAsc)
    }
    
    func sorted(_ list: [NewsValue], ascendent: Bool = false) -> [NewsValue] {
        var orderList: [NewsValue] = []
        if !ascendent {
            orderList = list.sorted(by: { convertDateFromString($0.date) > convertDateFromString($1.date) })
        } else {
            orderList = list.sorted(by: { convertDateFromString($0.date) < convertDateFromString($1.date) })
        }
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
    
    func filter(by searchValue: String) -> [NewsValue] {
        if searchValue.isEmpty || searchValue == "" {
            return self.newsValues
        }
        
        let orderList = self.newsValues.filter { searchText in
            return searchText.title.lowercased().contains(searchValue.lowercased())
        }
        return orderList
    }
}

