//
//  QuestionView.swift
//  Exams-App
//
//  Created by Duncan Kent on 03/03/2022.
//

import SwiftUI

struct QuestionView: View {
    
    @Binding var question: Question
    
    var body: some View {
        
        VStack {
            
            TextField("", text: $question.title)
                .placeholder(Text("Add question here")
                                .foregroundColor(.theme.accentSecondary), show: question.title.isEmpty)
                .font(.interRegular16)
                .foregroundColor(.theme.accentPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 24)
            
            Divider()
                .padding(.bottom, 16)
                .padding(.horizontal)
            
            
            ForEach($question.options) { option in
                QuestionCell(optionText: option.text, correct: $question.correctOption, deleteRequested: {
                    question.options = question.options.filter({$0.id != option.id})
                })
            }
            
           
            
            HStack {
                
                Button {
                    
                } label: {
                    Text("Discard")
                        .font(.interMedium16)
                        .foregroundColor(.theme.accentRed)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Save")
                        .font(.interMedium16)
                        .foregroundColor(.theme.accentGreen)
                }
                
            }
            .padding(.horizontal, 26)
            .padding(.top, 24)
            
        }
        .padding(.bottom)
        
        .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
        .padding(.horizontal, 16)
        
    }
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView(question: <#Binding<Question>#>)
//    }
//}
