//
//  ContentView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 4/5/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var greyColor = Color(red: 65/255, green: 65/255, blue: 65/255)
    @ObservedObject
    private var viewModel: NewsViewModel
    
    init(_ viewModel: NewsViewModel = NewsViewModel()) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Developer Apple")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(greyColor)
                .padding(.top, 8)
                .padding(.bottom, 2)
                .padding(.leading, 24)
            Text("News and Updates")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(greyColor)
                .padding(.leading, 24)
            Divider()
            Button("Filter inverter", action: {
                self.viewModel.invertSortList()
            })
            List(viewModel.newsValues){ item in
                if item.boolLittleImage {
                    ZStack{
                        NewRoundImageRowView(new: item)
                        Button {
                            logEvent(item.title)
                            print("Button pressed idx: \(item)")
                        } label: {
                        }
                    }
                }else{
                    ZStack{
                        NewFullImageRowView(new: item)
                        Button {
                            logEvent(item.title)
                            print("Button pressed idx: \(item)")
                        } label: {
                        }
                    }
                }
            }.onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
    
    func logEvent(_ recordName: String){
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "id-\(recordName)",
          AnalyticsParameterItemName: recordName,
          AnalyticsParameterContentType: "cont"
          ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

