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
    //time interval typealias?
    let marks: Int
    let category: String
    
    let instructions: String
    let questions: [String:Bool]
    
}
