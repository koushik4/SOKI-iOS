//
//  UserModel.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/1/24.
//

import Foundation
import FirebaseAuth
import SwiftUI

public class UserViewModel: ObservableObject {
    @Published var email = "";
    @Published var password = "";
    @Published var firstName = "";
    @Published var lastName = "";
    @Published var errorMessage = "";
    
    private final var DEFAULT_ERROR_MESSAGE = "Something went wrong, please try again"
    
    
    public init() {
        
    }
    
    public func login() {
        guard isValidEmail(email: email),
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              password.trimmingCharacters(in: .whitespacesAndNewlines).count > 6 else {
            errorMessage = "Invalid Email/Password";
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) {(authResult, error) in
            if error != nil {
                self.errorMessage = error?.localizedDescription ?? self.DEFAULT_ERROR_MESSAGE
            }
            let user = authResult?.user;
            if user == nil {
                self.errorMessage = self.DEFAULT_ERROR_MESSAGE
            }
            DBHelper.getUser(userId:user?.uid ?? "");
            self.errorMessage = "";
        }
        
    }
    
    public func signup() {
        guard isValidEmail(email: email),
              !firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              password.trimmingCharacters(in: .whitespacesAndNewlines).count > 6 else {
            errorMessage = "Invalid Credential, Please check again";
            return
        }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                self.errorMessage = error?.localizedDescription ?? self.DEFAULT_ERROR_MESSAGE
            }
            let user = authResult?.user;
            if user == nil {
                self.errorMessage = self.DEFAULT_ERROR_MESSAGE
                return
            }
            let uid = user?.uid;
            if uid == nil {
                self.errorMessage = self.DEFAULT_ERROR_MESSAGE
                return
            }
            
            DBHelper.addUser(user: DBUserCollection(userId: uid ?? "", email: self.email,
                                                    lastName: self.lastName, firstName: self.firstName,
                                                    assignedByMe: [], assignedTyMe: []));
            print("Signed Up")
            self.errorMessage = "";
        }
    }
    
    private func isValidEmail(email: String) -> Bool {
        guard !email.isEmpty, !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                return false
        }
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
}
