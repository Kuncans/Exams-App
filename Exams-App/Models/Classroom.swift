//
//  Classroom.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import Foundation

struct Classroom {
    
    let name: String
    let classesAttended: Int
    let classesMissed: Int
    let classesLeft: Int
    var classesTotal: Int {
        classesLeft + classesMissed + classesAttended
    }
    
    lazy var classNameAbbreivation: String = {
        let nameSplit = name.split { String($0).range(of: #"\w"#, options: .regularExpression) == nil }
        var abbreviation: String = ""
        for word in nameSplit {
            if word.count > 3 {
                abbreviation += word.prefix(1).capitalized
            }
        }
        return abbreviation
    }()
}

//    var classNameAbbreviation: String {
//        let nameSplit = name.split { String($0).range(of: #"\w"#, options: .regularExpression) == nil }
//        var abbreviation: String = ""
//        for word in nameSplit {
//            if word.count > 3 {
//                abbreviation += word.prefix(1).capitalized
//            }
//        }
//        return abbreviation
//    }
    

