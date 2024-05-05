//
//  DBHelper.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/1/24.
//

import Foundation
import FirebaseDatabase

class DBHelper {
    static var ref = Database.database().reference()
    static var user: DBUserCollection = DBUserCollection()
    
    public static func addUser(user: DBUserCollection) {
        if user.userId == "" {
            return
        }
        ref.child("users").child(user.userId).setValue(user.toDictionary()) { (error, _) in
            if error != nil {
                print("Something went wrong")
            } else {
                self.user = user;
            }
        };
    }
    
    public static func updateUser(user: DBUserCollection) {
        if user.userId == "" {
            return
        }
        print("mama",user.toDictionary())
        ref.child("users").child(user.userId).setValue(user.toDictionary()) { (error, _) in
            if error != nil {
                print("Something went wrong")
            } else {
                self.user = user;
            }
        };
    }
    
    public static func getTaskKey()->String? {
        return ref.child("tasks").childByAutoId().key
    }
    
    public static func getUserWithIdAndDoIfExists(userId: String, action: @escaping ()->Void) {
        if userId == "" {
            return
        }
        ref.child("users").child(userId).observe(.value) { snapshot in
            print("havana oh na=na")
            let user = decodeUser(snapshot: snapshot) ;
            if user == nil {
                return
            }
            action();
            self.user = user ?? DBUserCollection();
        }
    }
    
    public static func addTaskIfAssigneeIsValid(task:DBTaskCollection)  {
        if task.taskId == "" {
            return
        }
        
        ref.child("users").observeSingleEvent(of: .value) { snapshot in
            for dataSnapShot in snapshot.children {
                if let snap = dataSnapShot as? DataSnapshot, let otherUser = decodeUser(snapshot: snap), otherUser.email == task.assignedTo {
                    // updtae assign by
                    if var assignedToMe = otherUser.assignedToMe {
                        assignedToMe.append(task.taskId)
                        otherUser.assignedToMe = assignedToMe
                    } else {
                        otherUser.assignedToMe = [task.taskId]
                    }
                    
                    //update assign to
                    if var assignedByMe = self.user.assignedByMe {
                        assignedByMe.append(task.taskId)
                        self.user.assignedByMe = assignedByMe
                    } else {
                        self.user.assignedByMe = [task.taskId]
                    }
                    
                    print("lmao", self.user.toDictionary(), otherUser.toDictionary())
                    task.assignedByFirstName = self.user.firstName
                    task.assignedToFirstName = otherUser.firstName
                    
                    // add task to db
                    ref.child("tasks").child(task.taskId).setValue(task.toDictionary()) {(error, _) in
                        if error != nil {
                            print("Something went wrong")
                            return
                        }
                        
                        // update users
                        updateUser(user: self.user)
                        updateUser(user: otherUser)
                    };
                    break
                }
            }
        }
    }
    
    private static func decodeUser(snapshot:DataSnapshot) -> DBUserCollection? {
        if !snapshot.exists() {
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: snapshot.value ?? ["":""])
            let user = try JSONDecoder().decode(DBUserCollection.self, from: data)
            print(user.toDictionary());
            return user
        } catch {
            print("Error decoding user data:", error)
            return nil
        }
    }
}
