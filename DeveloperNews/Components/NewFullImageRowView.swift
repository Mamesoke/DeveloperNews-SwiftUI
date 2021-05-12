//
//  NewFullImageRowView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 8/5/21.
//

import SwiftUI

struct NewFullImageRowView: View {
    var new: NewsValue
    
    var body: some View {
        ZStack{
            RemoteImage(url: new.image)
                .aspectRatio(contentMode: .fill)
                .frame(height:150)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.25)
                )
            
            Text(new.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white )
                .multilineTextAlignment(.center)
        }.padding(.vertical, 12)
    }
}
