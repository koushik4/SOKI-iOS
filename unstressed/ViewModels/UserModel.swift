//
//  UserModel.swift
//  unstressed
//
//  Created by Srinivas Koushik on 4/20/24.
//

import Foundation
import Firebase

class UserModel: ObservableObject {
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var password: String = ""
    @Published var errorMessage:String = ""
    @Published var move = true
    static var userModel: UserModel? = nil
    
    
    private init() {}
    
    public static func getInstance() -> UserModel {
        if userModel == nil {
            userModel = UserModel()
        }
        return userModel ?? UserModel()
    }
    
    private func createAccount(reEnteredPassword:String) {
        
    }
    
    private func validateForSignUp() -> Bool {
        guard validateEmail(email: email) else {
            errorMessage = "Shitty email bruh"
            return false
        }
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !fullName.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Shit's empty bruh"
            return false
        }
        
        guard password.trimmingCharacters(in: .whitespaces).count > 6 else {
            errorMessage = "Shit's pasword bruh"
            return false
        }
        
        
        self.errorMessage = ""
        return true
    }
    
    public func register() {
        guard self.validateForSignUp() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                self.errorMessage = error?.localizedDescription ?? "fuck yeah"
            }
        }
    }
    
    private func validateForLogin() -> Bool {
        guard validateEmail(email: email) else {
            errorMessage = "Shitty email bruh"
            print("Lol")
            return false
        }
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Shit's empty bruh"
            return false
        }
        
        return true
    }
    
    private func validateEmail(email:String)-> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespaces)
        
        return !trimmedEmail.isEmpty && trimmedEmail.contains("@") && trimmedEmail.contains(".")
    }
}
