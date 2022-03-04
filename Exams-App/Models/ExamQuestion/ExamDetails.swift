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
        self.sections = [Section()]
    }
}

class Section: Identifiable {
    let id = UUID().uuidString
    
    var title: String
    var description: String
    var questions: [Question]
    
    init() {
        self.title = ""
        self.description = ""
        self.questions = [Question()]
    }
}

class Question: Identifiable {
    let id = UUID().uuidString
    var title: String
    var options: [Option]
    var correctOption: String?
    
    init() {
        self.title = ""
        self.options = [Option(text: "")]
    }
}

class Option: Identifiable {
    let id = UUID().uuidString
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
