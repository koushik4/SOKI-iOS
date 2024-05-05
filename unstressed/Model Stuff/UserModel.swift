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
    
    @Published var loggedIn = false;
    
    private static var userModel:UserViewModel?
    
    public final var DEFAULT_ERROR_MESSAGE = "Something went wrong, please try again"
    
    private init() {
    }
    
    public static func getInstance() -> UserViewModel {
        if UserViewModel.userModel == nil {
            UserViewModel.userModel = UserViewModel();
        }
        return UserViewModel.userModel ?? UserViewModel()
    }
    
    
    public func checkAlreadySignedIn() {
        if let currentUser = Auth.auth().currentUser {
            DBHelper.getUserWithIdAndDoIfExists(userId: currentUser.uid) {
                self.loggedIn = true
            }
        }
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
            DBHelper.getUserWithIdAndDoIfExists(userId:user?.uid ?? "") {
                self.loggedIn = true
            };
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
        
        AuthDBHelper.signUpDB(email: email, password: password)
        
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
            self.loggedIn = true
            self.errorMessage = "";
        }
    }
    
    public func signout() {
        do {
            try Auth.auth().signOut()
            self.loggedIn = false;
            print(self.loggedIn)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
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
