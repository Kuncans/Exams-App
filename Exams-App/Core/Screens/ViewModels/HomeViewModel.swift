//
//  HomeViewModel.swift
//  Exams-App
//
//  Created by Duncan Kent on 02/03/2022.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // UI - Tab Selection
    @Published var selectedTab: Int = 3
    
    // Data
    @Published var exams: [Exam] = []
    @Published var classrooms: [Classroom] = []
    @Published var user: User = MockUser.user
    @Published var selectedClass: Classroom = MockClassroom.classrooms.first!
    
    // Creating a new Exam
    @Published var newExamClassroom: Classroom?
    @Published var newExamModule: String = ""
    
    @Published var newExamDateDay: String = ""
    @Published var newExamDateMonth: String = ""
    @Published var newExamDateYear: String = ""
    
    @Published var newExamTimeHour: String = ""
    @Published var newExamTimeMins: String = ""
    @Published var newExamTimeSecs: String = ""
    
    @Published var newExamDurationHour: String = ""
    @Published var newExamDurationMins: String = ""

    @Published var newExamDurationTimeframeHour: String = ""
    @Published var newExamDurationTimeframeMins: String = ""
    
    @Published var newExamTotalMarks: Int?
    @Published var newExamCategory: String = ""
    
    init() {
        self.exams.append(contentsOf: [MockExam.exam, MockExam.exam, MockExam.exam, MockExam.exam])
        self.classrooms = MockClassroom.classrooms
    }
}
