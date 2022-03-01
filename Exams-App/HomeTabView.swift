//
//  HomeTabView.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import SwiftUI

struct HomeTabView: View {
    
    @State private var selection = 3
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Placeholder 1")
                .tabItem {
                    Image(systemName: "swift")
                    Text("Page 1")
                }
                .tag(1)
            
            Text("Placeholder 2")
                .tabItem {
                    Image(systemName: "swift")
                    Text("Page 2")
                }.tag(2)
            
            Text("Dashboard")
                .tabItem {
                    Image(systemName: "squareshape.split.3x3")
                    Text("Dashboard")
                }.tag(3)
            
            Text("Exams")
                .tabItem {
                    Image(systemName: "graduationcap")
                    Text("Exams")
                }.tag(4)
            
            Text("Placeholder 5")
                .tabItem {
                    Image(systemName: "swift")
                    Text("Page 5")
                }
                .tag(5)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
