//
//  AuthDBHelper.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/4/24.
//

import Foundation
import FirebaseAuth

class AuthDBHelper {
    public static func signUpDB(email: String, password:String) {
        let userModel: UserViewModel = UserViewModel.getInstance();
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                userModel.errorMessage = error?.localizedDescription ??  userModel.DEFAULT_ERROR_MESSAGE
            }
            let user = authResult?.user;
            if user == nil {
                userModel.errorMessage = userModel.DEFAULT_ERROR_MESSAGE
                return
            }
            let uid = user?.uid;
            if uid == nil {
                userModel.errorMessage = userModel.DEFAULT_ERROR_MESSAGE
                return
            }
            
            DBHelper.addUser(user: DBUserCollection(userId: uid ?? "", email: userModel.email,
                                                    lastName: userModel.lastName, firstName: userModel.firstName,
                                                    assignedByMe: [], assignedTyMe: []));
            userModel.loggedIn = true
            userModel.errorMessage = "";
        }
    }
}
