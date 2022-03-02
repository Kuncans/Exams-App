//
//  ExamEntity+CoreDataProperties.swift
//  Exams-App
//
//  Created by Duncan Kent on 02/03/2022.
//
//

import Foundation
import CoreData


extension ExamEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExamEntity> {
        return NSFetchRequest<ExamEntity>(entityName: "ExamEntity")
    }

    @NSManaged public var classroom: String
    @NSManaged public var startTime: Date
    @NSManaged public var endTime: Date
    @NSManaged public var marks: Int64
    @NSManaged public var category: String
    @NSManaged public var timeframe: String
    @NSManaged public var module: String

}

extension ExamEntity : Identifiable {

}
