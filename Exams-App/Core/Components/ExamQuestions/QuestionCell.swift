//
//  QuestionCell.swift
//  Exams-App
//
//  Created by Duncan Kent on 03/03/2022.
//

import SwiftUI

struct QuestionCell: View {
    
    @Binding var optionText: String
    @Binding var correct: String?
    
    let deleteRequested: () -> Void
    
    var body: some View {
        
        HStack {
            Image(systemName: optionText == correct ? "record.circle" : "circle")
                .renderingMode(.template)
                .foregroundColor(.theme.accentPrimary)
                .onTapGesture {
                    correct = optionText
                }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                HStack {
                    Text("A")
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(RoundedRectangle(cornerRadius: 5).fill(optionText == correct ? Color.theme.accentPrimary : Color.theme.questionBackground))
                        

                    
                    TextField("Add Option...", text: $optionText)
                        .font(.interLight15)
                        .padding(.leading, 12)
                        .frame(width: 200, height: 30, alignment: .leading)
                    
                    
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(RoundedRectangle(cornerRadius: 5).fill(optionText == correct ? Color.theme.questionBackground : Color.theme.backgroundCard))
                .background(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: optionText == correct ? 0 : 2))
                .foregroundColor(.theme.textSecondary)
                
                Spacer()
                
                Image(systemName: "x.circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(.theme.accentSecondary)
                    .onTapGesture {
                        deleteRequested()
                    }
                
                
            }
            
            
        }
        .padding(.horizontal)
        .padding(.bottom, 16)
        
    }
}

struct QuestionCell_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCell(optionText: .constant(""), correct: .constant(""), deleteRequested: {})
    }
}
