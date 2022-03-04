//
//  SectionView.swift
//  Exams-App
//
//  Created by Duncan Kent on 03/03/2022.
//

import SwiftUI

struct SectionView: View {
    
    @Binding var exam: Section
    
    var body: some View {
        
        VStack {
            
            Text("Section Name")
                .font(.interRegular14)
                .foregroundColor(.theme.textSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            TextField("Section title", text: $exam.title)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                .font(.interRegular14)
                .foregroundColor(.black)
                .padding(.horizontal)
            
            TextField("Section description (optional)", text: $exam.description)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(.bottom, 36)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.theme.backgroundCard))
                .font(.interRegular14)
                .foregroundColor(.black)
                .padding(.horizontal)
            
            ForEach($exam.questions) { question in
                QuestionView(question: question)
            }
                        
        }
        
        
    }
}

//struct SectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionView()
//    }
//}
