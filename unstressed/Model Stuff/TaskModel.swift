//
//  TaskModel.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import Foundation
import FirebaseAuth

class TaskModel: ObservableObject {
    var title: String = ""
    var description:String = ""
    var timestamp: Date = Date.now
    var category: String = Constants.PERSONAL_TAG
    var assigneeFirstName = ""
    var assignerFirstName = ""
    var taskId:String = ""
    
    @Published var showMenuBar = true
    
    public init() {
        
    }
    
    public func title(title:String)->TaskModel {
        self.title = title
        return self
    }
    
    public func description(description:String)->TaskModel {
        self.description = description
        return self
    }
    
    public func assigneeFirstName(email:String)->TaskModel {
        self.assigneeFirstName = email
        return self
    }
    
    public func assignerFirstName(email:String)->TaskModel {
        self.assignerFirstName = email
        return self
    }
    
    public func category(category:String)->TaskModel {
        self.category = category
        return self
    }
    
    public func timestamp(timestamp:Date)->TaskModel {
        self.timestamp = timestamp
        return self
    }
    
    public func dateFromMilliseconds() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        
        return dateFormatter.string(from: timestamp)
    }
    
    public init(category:String) {
        self.category = category
    }
    
    func addTaskToDb() {
        let dbTaskModel = DBTaskCollection()
            .id(taskId: DBHelper.getTaskKey() ?? "")
            .title(title: title)
            .description(description: description)
            .deadline(date: timestamp)
            .assignedTo(email: assigneeFirstName)
            .assignedBy(email: DBHelper.user.email)
            .category(category: category)
        
        
        DBHelper.addTaskIfAssigneeIsValid(task:dbTaskModel)
    }
    
    func validate() -> Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !category.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !assigneeFirstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !assignerFirstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        return true
    }
    
    public func toggle() {
        showMenuBar = true
    }
    
}
