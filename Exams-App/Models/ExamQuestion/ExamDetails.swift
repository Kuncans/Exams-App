//
//  ExamDetails.swift
//  Exams-App
//
//  Created by Duncan Kent on 03/03/2022.
//

import Foundation

class ExamDetails {
    var instructions: String
    var sections: [Section]
    
    init() {
        self.instructions = ""
        self.sections = []
    }
}

class Section {
    var title: String
    var description: String?
    var questions: [Question]
    
    init() {
        self.title = ""
        self.questions = []
    }
}

class Question {
       
    var question: String
    var options: [String]
    var correctOption: String?
    
    init() {
        self.question = ""
        self.options = []
    }
    
    private func addOption (str: [String]) {
        options.append(contentsOf: str)
    }
    
}
