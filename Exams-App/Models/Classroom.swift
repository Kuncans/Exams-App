//
//  Classroom.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import Foundation

struct Classroom: Hashable {
    
    let name: String
    let classesAttended: Int
    let classesMissed: Int
    let classesLeft: Int
    var classesTotal: Int {
        classesLeft + classesMissed + classesAttended
    }
    var classAttendance: Double {
        return (Double(classesAttended) / Double(classesMissed + classesAttended)) * 100
    }
    
    var classNameAbbreivation: String {
        let nameSplit = name.split { String($0).range(of: #"\w"#, options: .regularExpression) == nil }
        var abbreviation: String = ""
        for word in nameSplit {
            if word.count > 3 {
                abbreviation += word.prefix(1).capitalized
            }
        }
        return abbreviation
    }

}

struct MockClassroom {
    
    static let classrooms: [Classroom] = [
        Classroom(name: "Object Oriented Programming in Java", classesAttended: 34, classesMissed: 12, classesLeft: 30),
        Classroom(name: "Data Structures and Algorithms", classesAttended: 40, classesMissed: 2, classesLeft: 22)
    ]
    
    
}


    

