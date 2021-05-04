//
//  ContentView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 4/5/21.
//

import SwiftUI

struct ContentView: View {
    var news = [
        New(name: "Apple Search Ads introduces a new way to promote apps", date: "May 4, 2021", image: "app-store"),
        New(name: "Search suggestions now on the App Store", date: "April 29, 2021", image: "app-store"),
        New(name: "What’s new in advertising attribution technologies", image: "ios14-outlined"),
        New(name: "Online group event in-app purchase requirement update", image: "asc-outline"),
        New(name: "Upcoming AppTrackingTransparency requirements", image: "ios14-outlined"),
        New(name: "App Store submission update", image: "asc-outline"),
        New(name: "Program enrollment available in more regions in the Apple Developer app", image: "apple-developer-app"),
        New(name: "Get ready for AppTrackingTransparency", image: "ios14-outlined"),
        New(name: "Updates to App Store server notifications", image: "storekit"),
        New(name: "Reminder: APNs provider API requirement starts March 31", image: "notifications"),
        New(name: "Additional guidance available for App Store privacy labels", image: "app-store"),
        New(name: "App Analytics now includes App Clip data", image: "app-clips"),
    ]
    var body: some View {
        List(news.indices){ idx in
            if self.news[idx].feature{
                ZStack{
                    NewFullImageRow(new: self.news[idx])
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
                .frame(width: 80, height: 80)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(new.name)
                    .font(.body)
                    .padding(.bottom, 4)
                
                Text(new.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
            }
            
        }
        .padding(.all, 8)
    }
}

struct NewFullImageRow : View {
    var new: New
    
    var body: some View {
        ZStack{
            Image(new.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:200)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.25)
            )
            
            Text(new.name)
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white )
                .multilineTextAlignment(.center)
        }
    }
}

