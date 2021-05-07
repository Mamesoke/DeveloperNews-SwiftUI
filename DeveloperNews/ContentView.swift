//
//  ContentView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 4/5/21.
//

import SwiftUI

struct ContentView: View {
    var greyColor = Color(red: 65/255, green: 65/255, blue: 65/255)
    var news = [
        NewModel(name: "Apple Search Ads introduces a new way to promote apps", date: "May 4, 2021", image: "app-store"),
        NewModel(name: "Search suggestions now on the App Store", date: "April 29, 2021", image: "app-store"),
        NewModel(name: "What’s new in advertising attribution technologies", image: "ios14-outlined"),
        NewModel(name: "Online group event in-app purchase requirement update", image: "asc-outline"),
        NewModel(name: "Upcoming AppTrackingTransparency requirements", image: "ios14-outlined"),
        NewModel(name: "App Store submission update", image: "asc-outline"),
        NewModel(name: "Program enrollment available in more regions in the Apple Developer app", image: "apple-developer-app"),
        NewModel(name: "Get ready for AppTrackingTransparency", image: "ios14-outlined"),
        NewModel(name: "Announcing WWDC21", date: "March 30, 2021", image: "full-image", feature: true),
        NewModel(name: "Updates to App Store server notifications", image: "storekit"),
        NewModel(name: "Reminder: APNs provider API requirement starts March 31", image: "notifications"),
        NewModel(name: "Additional guidance available for App Store privacy labels", image: "app-store"),
        NewModel(name: "App Analytics now includes App Clip data", image: "app-clips"),
    ]
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
            List(news.indices){ idx in
                if self.news[idx].feature{
                    ZStack{
                        NewFullImageRowView(new: self.news[idx])
                        Button {
                            print("Button pressed idx: \(idx)")
                        } label: {
                        }
                    }
                }else{
                    ZStack{
                        NewRoundImageRowView(new: self.news[idx])
                        Button {
                            print("Button pressed idx: \(idx)")
                        } label: {
                        }
                    }
                }
               
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
