//
//  TaskFetcher.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/5/24.
//

import Foundation
import FirebaseDatabase

class TaskFetcher: ObservableObject {
    @Published var items: [(TaskItemView, Bool)]
    @Published var should: [Bool] = []
    private static var fetcher:TaskFetcher?
    
    private init() {
        items = []
        DBHelper.ref.child("tasks").observe(.value, with: { snapshot in
            self.items = []
            print("hello kou")

            for dataSnapShot in snapshot.children {
                if let snap = dataSnapShot as? DataSnapshot, let task = TaskFetcher.decodeTask(snapshot: snap) {
                    if (DBHelper.user.assignedByMe ?? []).contains(task.taskId) || (DBHelper.user.assignedToMe ?? []).contains(task.taskId) {
                        let model = TaskModel()
                            .title(title: task.title)
                            .description(description: task.description)
                            .timestamp(timestamp: Date(timeIntervalSince1970: Double(task.deadline/1000)))
                            .category(category: task.category)
                            .assigneeFirstName(email: task.assignedToFirstName)
                            .assignerFirstName(email: task.assignedByFirstName)
                        
                        self.items.append((TaskItemView(taskModel: model), false))
                    }

                }
            }
        })
    }
    
    public static func getInstance() -> TaskFetcher {
        if fetcher == nil {
            fetcher = TaskFetcher()
            return fetcher ?? TaskFetcher()
        }
        return fetcher ?? TaskFetcher()
    }
    
    public func deleteIndex(i:Int) {
        self.items.remove(at: i)
    }
    
    public static func decodeTask(snapshot:DataSnapshot) -> DBTaskCollection? {
        if !snapshot.exists() {
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: snapshot.value ?? ["":""])
            let task = try JSONDecoder().decode(DBTaskCollection.self, from: data)
            print(task.toDictionary());
            return task
        } catch {
            print("Error decoding user data:", error)
            return nil
        }
    }
    
}
