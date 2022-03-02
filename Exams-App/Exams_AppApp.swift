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
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .environmentObject(vm)
        }
    }
}
