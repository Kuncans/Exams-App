//
//  CoreDataManager.swift
//  Exams-App
//
//  Created by Duncan Kent on 02/03/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    var savedExams: [ExamEntity] = []
    
    let container: NSPersistentContainer
    private let containerName = "ExamsContainer"
    private let entityName = "ExamEntity"
    
    init() {
        
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data \(error)")
            }
        }
        getSavedExams()
        add(exam: MockExam.exam)
        add(exam: MockExam.exam2)
        add(exam: MockExam.exam3)
        add(exam: MockExam.exam4)
    }
    
    func getSavedExams() {
        let request = NSFetchRequest<ExamEntity>(entityName: entityName)
        do {
            savedExams = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching saved exams \(error)")
        }
    }
    
    func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            container.viewContext.rollback()
            print("Error saving to Core Data \(error)")
        }
        
        getSavedExams()
    }
    
    func add(exam: Exam) {
        let entity = ExamEntity(context: container.viewContext)
        entity.category = exam.category
        entity.classroom = exam.classroom.name
        entity.marks = Int64(exam.marks)
        entity.endTime = exam.endDateTime
        entity.startTime = exam.examDateTime
        entity.timeframe = exam.timeframe
        entity.module = exam.syllabus
        
        save()
    }
    
}
