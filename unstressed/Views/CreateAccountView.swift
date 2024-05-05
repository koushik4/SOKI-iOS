//
//  SignupView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 4/20/24.
//

import SwiftUI

struct CreateAccountView: View {
    @ObservedObject var userModel = UserModel.getInstance()
    @State var move = true
    
    var mom: Bool = true
    var body: some View {
        if userModel.move {
            content
        } else {
            SOKIButton(buttonTitle: "Sign up", color: .pink, action: {
                userModel.move.toggle()
                userModel.errorMessage = "mama"
            })
        }
    }
    
    
    @ViewBuilder
    var content: some View {
        VStack {
            HeaderView(title: "Create Account")
           
            Form {
                if userModel.errorMessage != "" {
                    Text(userModel.errorMessage)
                        .foregroundStyle(.red)
                        .font(.system(size: 15))
                        .listRowSeparator(.hidden)
                }
                
                TextField("Name", text: $userModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text: $userModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                
                SecureField("Password", text: $userModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                
                SOKIButton(buttonTitle: "Sign up", color: .pink, action: {
                    userModel.move.toggle()
                    userModel.errorMessage = "mama"
                })
                .padding(.top, 10)
            }
            .offset(y: -10)
        }
    }
}




#Preview {
    CreateAccountView()
}
