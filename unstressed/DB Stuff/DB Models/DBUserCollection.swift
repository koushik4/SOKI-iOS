//
//  DBUserCollection.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/1/24.
//

import Foundation
import FirebaseDatabase

class DBUserCollection: Codable {
    let userId: String
    let email: String
    let lastName: String
    let firstName: String
    let assignedByMe: [String]?
    let assignedTyMe: [String]?
    
    public init() {
        self.userId = ""
        self.email = ""
        self.lastName = ""
        self.firstName = ""
        self.assignedByMe = []
        self.assignedTyMe = []
    }
    
    init(userId: String, email: String, lastName: String, firstName: String, assignedByMe: [String], assignedTyMe: [String]) {
        self.userId = userId
        self.email = email
        self.lastName = lastName
        self.firstName = firstName
        self.assignedByMe = assignedByMe
        self.assignedTyMe = assignedTyMe
    }
    
    public func toDictionary() -> [String: Any] {
        return [
            "userId": userId,
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "assignedByMe": [],
            "assignedToMe": []
            // Add more properties as needed
        ]
    }
}
