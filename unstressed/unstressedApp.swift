//
//  unstressedApp.swift
//  unstressed
//
//  Created by Srinivas Koushik on 4/18/24.
//

import SwiftUI
import Firebase

@main
struct unstressedApp: App {
    @ObservedObject var user: UserViewModel = UserViewModel.getInstance()

    init() {
        FirebaseApp.configure()
        user.checkAlreadySignedIn()
    }
    
    var body: some Scene {
        WindowGroup {
            if !user.loggedIn {
                LoginView()
            } else {
                HomePageView()
            }
        }
    }
}
