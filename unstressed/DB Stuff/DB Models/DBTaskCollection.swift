//
//  DBTaskCollection.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/4/24.
//

import Foundation

class DBTaskCollection: Codable {
    var taskId:String = ""
    var deadline:Int64 = 0
    var title: String = ""
    var category: String = Constants.PERSONAL_TAG
    var description: String = ""
    var assignedBy: String = ""
    var assignedTo: String = ""
    var assignedByFirstName: String = ""
    var assignedToFirstName: String = ""
    
    public init() {
        
    }
    
    public func id(taskId: String) -> DBTaskCollection {
        self.taskId = taskId
        return self
    }
    
    public func deadline(date: Date) -> DBTaskCollection {
        self.deadline = Int64(date.timeIntervalSince1970 * 1000.0)
        return self
    }
    
    public func title(title: String) -> DBTaskCollection {
        self.title = title
        return self
    }
    
    public func category(category: String) -> DBTaskCollection {
        self.category = category
        return self
    }
    
    public func description(description: String) -> DBTaskCollection {
        self.description = description
        return self
    }
    
    public func assignedBy(email: String) -> DBTaskCollection {
        self.assignedBy = email
        return self
    }
    
    public func assignedTo(email:String) -> DBTaskCollection {
        self.assignedTo = email
        return self
    }
    
    public func toDictionary() -> [String: Any] {
        return [
            "taskId": taskId,
            "title": title,
            "category": category,
            "deadline": deadline,
            "description": description,
            "assignedBy": assignedBy,
            "assignedTo": assignedTo,
            "assignedByFirstName": assignedByFirstName,
            "assignedToFirstName": assignedToFirstName
            // Add more properties as needed
        ]
    }
}
