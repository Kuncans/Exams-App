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
    @Published var exams: [ExamEntity] = []
    @Published var classrooms: [Classroom] = []
    @Published var user: User = MockUser.user
    @Published var selectedClass: Classroom = MockClassroom.classrooms.first!
    
    // Creating a new Exam
    @Published var newExamClassroom: Classroom?
    @Published var newExamModule: String = ""
    
    @Published var newExamDateYear: String = ""
    @Published var newExamDateMonth: String = ""
    @Published var newExamDateDay: String = ""

    @Published var newExamTimeHour: String = ""
    @Published var newExamTimeMins: String = ""
    @Published var newExamTimeSecs: String = ""
    
    @Published var newExamDurationHour: String = ""
    @Published var newExamDurationMins: String = ""

    @Published var newExamDurationTimeframeHour: String = ""
    @Published var newExamDurationTimeframeMins: String = ""
    
    @Published var newExamTotalMarks: Int?
    @Published var newExamCategory: String = ""
    
    // Exam Questions
    @Published var sampleQuestion: ExamDetails = ExamDetails.init()
    
    // Manager
    let CoreDM: CoreDataManager = CoreDataManager()
    
    init() {
        self.classrooms = MockClassroom.classrooms
        getCards()
    }
    
    func saveNewExam() {
        
        var dateComponents = DateComponents()
        dateComponents.year = 2000 + (Int(newExamDateYear) ?? 0)
        dateComponents.month = Int(newExamDateMonth)
        dateComponents.day = Int(newExamDateDay)
        dateComponents.hour = Int(newExamTimeHour)
        dateComponents.minute = Int(newExamTimeMins)
        dateComponents.second = Int(newExamTimeSecs)
        
        let calender = Calendar(identifier: .gregorian)
        let examDate = calender.date(from: dateComponents)
        
        let timeInterval: TimeInterval = ((Double(newExamDurationTimeframeHour) ?? 0) * 60 * 60) + ((Double(newExamDurationTimeframeMins) ?? 0) * 60)
        let endDateTime = examDate?.addingTimeInterval(timeInterval)
           
        let exam = Exam(classroom: newExamClassroom ?? MockClassroom.room,
                        syllabus: newExamModule,
                        examDateTime: examDate ?? Date(),
                        duration: "",
                        endDateTime: endDateTime ?? Date(),
                        marks: newExamTotalMarks ?? 0,
                        category: newExamCategory,
                        instructions: "",
                        questions: ["" : true])
        
        CoreDM.add(exam: exam)
        
        resetNewExamValues()
        
        getCards()
    }
    
    private func resetNewExamValues () {
        
        self.newExamClassroom = nil
        self.newExamModule = ""
        self.newExamDateYear = ""
        self.newExamDateMonth = ""
        self.newExamDateDay = ""
        self.newExamTimeHour = ""
        self.newExamTimeMins = ""
        self.newExamTimeSecs = ""
        self.newExamDurationHour = ""
        self.newExamDurationMins = ""
        self.newExamDurationTimeframeHour = ""
        self.newExamDurationTimeframeMins = ""
        self.newExamTotalMarks = nil
        self.newExamCategory = ""
        
    }
    
    private func getCards() {
        DispatchQueue.main.async {
            self.CoreDM.getSavedExams()
            self.exams = self.CoreDM.savedExams
        }
    }
}
