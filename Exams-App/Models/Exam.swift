//
//  Exam.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import Foundation

struct Exam {
    
    let classroom: Classroom
    let syllabus: String
    let examDateTime: Date
    let duration: String
    let endDateTime: Date
    let marks: Int
    let category: String
    let instructions: String
    let questions: [String:Bool]
    
    var timeframe: String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        let hourString = formatter.string(from: examDateTime)
        let hourEndString = formatter.string(from: endDateTime)
        
        return hourString + " - " + hourEndString
    }
    
}

struct MockExam {
    
    static let exam = Exam(classroom: MockClassroom.classrooms.first!,
                           syllabus: "MCQs",
                           examDateTime: Date(),
                           duration: "",
                           endDateTime: Date(),
                           marks: 20,
                           category: "Internal",
                           instructions: "Take the test",
                           questions: ["Option 1": true])
    
}
