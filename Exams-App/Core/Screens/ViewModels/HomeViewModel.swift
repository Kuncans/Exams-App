//
//  HomeViewModel.swift
//  Exams-App
//
//  Created by Duncan Kent on 02/03/2022.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var exams: [Exam] = []
    @Published var classrooms: [Classroom] = []
    @Published var user: User = MockUser.user
    @Published var selectedClass: Classroom = MockClassroom.classrooms.first!
    
    @Published var newExamClassroom: Classroom?
    @Published var newExamModule: String = ""
    
    @Published var selectedTab: Int = 3
    
    init() {
        self.exams.append(contentsOf: [MockExam.exam, MockExam.exam, MockExam.exam, MockExam.exam])
        self.classrooms = MockClassroom.classrooms
    }
}
