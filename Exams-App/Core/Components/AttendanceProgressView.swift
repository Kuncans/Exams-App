//
//  AttendanceProgressView.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import SwiftUI

struct AttendanceProgressView: View {
    
    let attendance: Float

    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(lineWidth: 8)
                .foregroundColor(Color("ProgressViewBackground"))
            
            Circle()
                .trim(from: 0.0, to: (CGFloat(attendance) / 100))
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(.theme.accentGreen)
                .rotationEffect(Angle(degrees: 270))
                .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 1.5), value: attendance)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            
            Text("\(attendance, specifier: "%.0f")%")
                .font(.title)
                .foregroundColor(.theme.accentGreen)
                .animation(.easeInOut, value: attendance)
            
        }
    }
}

struct AttendanceProgressView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceProgressView(attendance: 55.55)
    }
}
