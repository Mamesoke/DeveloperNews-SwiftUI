//
//  NewFullImageRowView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 8/5/21.
//

import SwiftUI

struct NewFullImageRowView: View {
    var new: NewModel
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
