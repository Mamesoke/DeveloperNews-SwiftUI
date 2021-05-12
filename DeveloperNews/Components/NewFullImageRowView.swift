//
//  NewFullImageRowView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 8/5/21.
//

import SwiftUI

struct NewFullImageRowView: View {
    var new: NewsValue
    let greyColor: Color = Color.init(red: 40/255, green: 40/255, blue: 40/255)
    let blackColor: Color = Color.init(red: 30/255, green: 30/255, blue: 30/255)
    
    var body: some View {
        ZStack{
            RemoteImage(url: new.image)
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 150, maxHeight: 200, alignment: .center)
                .cornerRadius(15)
                .overlay(
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(gradient: Gradient(colors: [blackColor, greyColor]),
                                                 startPoint: .top,
                                                 endPoint: .bottom))
                            .opacity(0.4)
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.gray)
                            .opacity(0.25)
                    }
                )
            
            
            Text(new.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white )
                .multilineTextAlignment(.center)
        }.padding(.vertical, 12)
    }
}
