//
//  LoginView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 4/20/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var userModel = UserModel.getInstance()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Login")
                
                Form {
                    if !userModel.errorMessage.isEmpty{
                        Text("Error")
                            .foregroundStyle(.red)
                            .font(.system(size: 15))
                            .listRowSeparator(.hidden)
                    }
                    
                    TextField("email", text: $userModel.email)
                    SecureField("password", text: $userModel.password)
                    
                    SOKIButton(buttonTitle: "Login", color: .pink) {
                        // validate credentuals
                    }
                }
                
                    // mama
                VStack {
                    
                    Text("New here?")
                    
                    NavigationLink("Create an account", destination: CreateAccountView())
                        
                }
                .padding(.top, 200)
                .offset(y: -200)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
