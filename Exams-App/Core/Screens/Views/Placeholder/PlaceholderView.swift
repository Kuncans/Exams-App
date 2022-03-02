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
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.theme.accentSecondary)
                .frame(width: 100, height: 100)
            
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
