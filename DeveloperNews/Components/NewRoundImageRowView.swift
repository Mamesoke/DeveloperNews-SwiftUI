//
//  NewRoundImageRowView.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 8/5/21.
//

import SwiftUI

struct NewRoundImageRowView: View {
    var new : NewsValue
    var body: some View {
        HStack {
            Image(new.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(new.title)
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
