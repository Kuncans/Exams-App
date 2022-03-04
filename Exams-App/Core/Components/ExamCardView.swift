//
//  ExamCardView.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import SwiftUI

struct ExamCardView: View {
    
    let exam: ExamEntity
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.theme.backgroundCard)
            
            VStack (spacing: 12) {
                HStack {
                    Text(exam.classroom)
                        .font(.interMedium20)
                        .lineLimit(2)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if exam.endTime < Date() && Date() > exam.startTime{
                    
                    Button("Take") {
                        print("Take Exam")
                    }
                    .foregroundColor(.white)
                    .frame(width: 55, height: 30)
                    .background(Color.theme.accentGreen)
                    .cornerRadius(5)
                    }
                    
                }
                
                HStack {
                    Text(exam.timeframe)
                    Spacer()
                    Text(exam.module)
                }
                .font(.interMedium14)
                .foregroundColor(.theme.textTertiary)
                
                HStack {
                    Text("\(exam.marks) Marks")
                        .foregroundColor(.theme.textTertiary)
                    Spacer()
                    Text("\(exam.category)")
                        .foregroundColor(.theme.accentPrimary)
                }
                .font(.interMedium14)
                
            }
            .padding(.horizontal, 20)
        }
        .frame(width: 300, height: 160)
        .padding(.trailing, 4)


    }
}

//struct ExamCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExamCardView(exam: MockExam.exam)
//    }
//}
