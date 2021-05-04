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
        New(name: "Apple Search Ads introduces a new way to promote apps", date: "May 4, 2021", image: "app-store"),
        New(name: "Search suggestions now on the App Store", date: "April 29, 2021", image: "app-store"),
        New(name: "What’s new in advertising attribution technologies", image: "ios14-outlined"),
        New(name: "Online group event in-app purchase requirement update", image: "asc-outline"),
        New(name: "Upcoming AppTrackingTransparency requirements", image: "ios14-outlined"),
        New(name: "App Store submission update", image: "asc-outline"),
        New(name: "Program enrollment available in more regions in the Apple Developer app", image: "apple-developer-app"),
        New(name: "Get ready for AppTrackingTransparency", image: "ios14-outlined"),
        New(name: "Announcing WWDC21", date: "March 30, 2021", image: "full-image", feature: true),
        New(name: "Updates to App Store server notifications", image: "storekit"),
        New(name: "Reminder: APNs provider API requirement starts March 31", image: "notifications"),
        New(name: "Additional guidance available for App Store privacy labels", image: "app-store"),
        New(name: "App Analytics now includes App Clip data", image: "app-clips"),
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
                        NewFullImageRow(new: self.news[idx])
                        Button {
                            print("Button pressed idx: \(idx)")
                        } label: {
                        }
                    }
                }else{
                    ZStack{
                        NewRoundImageRow(new: self.news[idx])
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

struct New: Identifiable {
    var id = UUID()
    var name: String
    var date: String = "01/01/2021"
    var image: String
    var feature: Bool = false
}



struct NewRoundImageRow: View {
    var new : New
    var body: some View {
        HStack {
            Image(new.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(new.name)
                    .font(.body)
                    .padding(.bottom, 2)
                
                Text(new.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
            }
            
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 80, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

struct NewFullImageRow : View {
    var new: New
    
    var body: some View {
        ZStack{
            Image(new.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:150)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.25)
            )
            
            Text(new.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white )
                .multilineTextAlignment(.center)
        }.padding(.vertical, 12)
    }
}

