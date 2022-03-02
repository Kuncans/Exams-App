//
//  ViewExtension.swift
//  Exams-App
//
//  Created by Duncan Kent on 02/03/2022.
//

import SwiftUI

struct Placeholder<T: View>: ViewModifier {
    var placeholder: T
    var show: Bool
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show { placeholder }
            content
        }
    }
}

extension View {
    
    func placeholder<T: View>(_ holder: T, show: Bool) -> some View {
        self.modifier(Placeholder(placeholder: holder, show: show))
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
