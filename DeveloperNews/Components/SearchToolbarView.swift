//
//  ToolsBar.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 23/5/21.
//

import SwiftUI

struct SearchToolbarView: View {
    var viewModel: NewsViewModel
    @State private var searchState = ""
    @State private var statusOrder = false
    
    var body: some View {
        HStack {
            TextField("Search ", text: $searchState) {
                self.viewModel.renderValues = self.viewModel.filter(by: searchState)
             }
            Button(self.statusOrder ? "Recent" : "Oldest", action: {
                self.viewModel.invertSortList()
                self.statusOrder = self.viewModel.sortedAsc
            })
        }.padding(.horizontal, 18)
    }
}
