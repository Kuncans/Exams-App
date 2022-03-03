//
//  ColorExtension.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accentPrimary = Color("AccentColor")
    let accentSecondary = Color("AccentSecondary")
    
    let accentBlue = Color("AccentBlue")
    let accentBlueSecondary = Color("AccentBlueSecondary")
    
    let accentRed = Color("AccentRed")
    let accentGreen = Color("AccentGreen")
    
    let textSecondary = Color("TextSecondary")
    let textTertiary = Color("TextTertiary")
    
    let backgroundCard = Color("BackgroundCard")
    let backgroundText = Color("BackgroundText")
    
    let questionBackground = Color("QuestionBackground")
    
}
