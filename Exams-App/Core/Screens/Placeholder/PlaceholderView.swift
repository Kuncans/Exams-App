//
//  PlaceholderView.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
       
        ZStack {
            
            Color.theme.backgroundCard.edgesIgnoringSafeArea(.all)
            
            Image(systemName: "swift")
            
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
