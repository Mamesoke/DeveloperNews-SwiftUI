//
//  NewModel.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 8/5/21.
//

import Foundation

struct NewModel: Identifiable {
    var id = UUID()
    var name: String
    var date: String = "01/01/2021"
    var image: String
    var feature: Bool = false
}
