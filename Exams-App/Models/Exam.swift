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
    
    var timeframe: String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        let hourString = formatter.string(from: examDateTime)
        let hourEndString = formatter.string(from: endDateTime)
        
        return hourString + " - " + hourEndString
    }
    
}

struct MockExam {
    
    static let exam = Exam(classroom: MockClassroom.classrooms[0    ],
                           syllabus: "MCQs",
                           examDateTime: Date(),
                           duration: "",
                           endDateTime: Date().addingTimeInterval(12000),
                           marks: 20,
                           category: "Internal",
                           instructions: "Take the test"
                            )
    
    static let exam2 = Exam(classroom: MockClassroom.classrooms[1],
                           syllabus: "AQA",
                            examDateTime: Date().addingTimeInterval(10000),
                           duration: "",
                            endDateTime: Date().addingTimeInterval(20000),
                           marks: 50,
                           category: "Mock",
                           instructions: "Do your best"
                            )
    
    static let exam3 = Exam(classroom: MockClassroom.classrooms[2],
                           syllabus: "OCR",
                            examDateTime: Date().addingTimeInterval(15000),
                           duration: "",
                            endDateTime: Date().addingTimeInterval(25000),
                           marks: 40,
                           category: "External",
                           instructions: "Remember to revise"
                            )
    
    static let exam4 = Exam(classroom: MockClassroom.classrooms[3],
                           syllabus: "MSTs",
                            examDateTime: Date().addingTimeInterval(10000),
                           duration: "",
                            endDateTime: Date().addingTimeInterval(15000),
                           marks: 10,
                           category: "Internal",
                           instructions: "Score high!"
                            )
    
}
