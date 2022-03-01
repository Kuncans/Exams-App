//
//  User.swift
//  Exams-App
//
//  Created by Duncan Kent on 01/03/2022.
//

import Foundation

struct User {
    
    let name: String
    let image: String
    
}

struct MockUser {
    
    static let user = User(name: "Duncan", image: "UserPlaceholder")
    
}
