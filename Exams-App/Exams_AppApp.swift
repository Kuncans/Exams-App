//
//  Exams_AppApp.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import SwiftUI

@main
struct Exams_AppApp: App {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.theme.accentSecondary)
    }
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
        }
    }
}
