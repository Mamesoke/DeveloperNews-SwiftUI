//
//  NewsViewModel.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 9/5/21.
//

import SwiftUI
import Firebase

class NewsViewModel: ObservableObject {
    private var newsValues = [NewModel]()
    var isFiltered = false
    
    @Published
    var renderValues = [NewModel]()
    
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
        self.renderValues = isFiltered ? self.renderValues.sort(ascendent: sortedAsc) : self.newsValues.sort(ascendent: sortedAsc)
    }
    
    func resetList() {
        self.renderValues = self.newsValues
    }
}

