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
    
    public static func getUser(userId: String) {
        if userId == "" {
            return
        }
        
        ref.child("users").child(userId).observeSingleEvent(of: .value) { snapshot in
            let user = decodeUser(snapshot: snapshot) ;
            if user == nil {
                return
            }
            self.user = user ?? DBUserCollection();
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
