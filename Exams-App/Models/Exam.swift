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
    let dateString: String
    let timeString: String
    let duration: String
    let timeframe: String
    let marks: Int
    let category: String
    let instructions: String
    let questions: [String:Bool]
    
}

struct MockExam {
    
    static let exam = Exam(classroom: MockClassroom.classrooms.first!,
                           syllabus: "MCQs",
                           dateString: "",
                           timeString: "",
                           duration: "",
                           timeframe: "3 pm - 6 pm",
                           marks: 20,
                           category: "Internal",
                           instructions: "Take the test",
                           questions: ["Option 1": true])
    
}
