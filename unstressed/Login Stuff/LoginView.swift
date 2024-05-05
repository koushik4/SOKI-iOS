//
//  LoginView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var user:UserViewModel = UserViewModel.getInstance();
    var body: some View {
        NavigationStack {
            ZStack {
                HeaderView(scale:1.5)
                
                VStack(spacing: 35) {
                    Text("Log In")
                        .font(.system(size: 30))
                        .foregroundStyle(Constants.DARKER_COLOR)
                    
                    if user.errorMessage != "" {
                        Text(user.errorMessage)
                            .font(.system(size:12))
                            .foregroundStyle(.red)
                            .bold()
                    }
                    
                    VStack(spacing: 20) {
                        
                        TextField("Email", text: $user.email)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        
                        SecureField("Password", text: $user.password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                        
                    }
                    .offset(y:-15)
                    
                    
                    VStack(spacing:20) {
                        SokiButton(title: "Log In", height: 40, width: 300, color: Constants.COLOR) {
                            user.login()
                        }
                        
                        HStack(spacing:1) {
                            Text("New here?")
                                .foregroundColor(Constants.MEDIUM_COLOR)
                                .font(.system(size: 14))

                            
                            NavigationLink(destination: SignupView()) {
                                Text("create an account")
                                    .bold()
                                    .foregroundColor(Constants.MEDIUM_COLOR)
                                    .font(.system(size: 14))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
