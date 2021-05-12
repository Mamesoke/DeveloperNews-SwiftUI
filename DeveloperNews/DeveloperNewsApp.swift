//
//  DeveloperNewsApp.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 4/5/21.
//

import SwiftUI
import Firebase

@main
struct DeveloperNewsApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
