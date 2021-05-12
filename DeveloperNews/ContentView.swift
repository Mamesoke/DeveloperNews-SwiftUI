//
//  ContentView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 4/5/21.
//

import SwiftUI

struct ContentView: View {
    var greyColor = Color(red: 65/255, green: 65/255, blue: 65/255)
    
    @ObservedObject
    private var viewModel = NewsViewModel()
    
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
            List(viewModel.newList){ item in
                if item.boolLittleImage {
                    ZStack{
                        NewRoundImageRowView(new: item)
                        Button {
                            print("Button pressed idx: \(item)")
                        } label: {
                        }
                    }
                }else{
                    ZStack{
                        NewFullImageRowView(new: item)
                        Button {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
