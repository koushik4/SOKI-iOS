//
//  SignupView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/1/24.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var user:UserViewModel = UserViewModel.getInstance();
    
    var body: some View {
        NavigationView {
            ZStack {
                HeaderView(scale:1.5)
                
                VStack(spacing: 35) {
                    Text("Sign Up")
                        .font(.system(size: 30))
                        .foregroundStyle(Constants.DARKER_COLOR)
                    
                    if user.errorMessage != "" {
                        Text(user.errorMessage)
                            .font(.system(size:12))
                            .foregroundStyle(.red)
                            .bold()
                    }
                    
                    VStack(spacing: 20) {
                        TextField("First Name", text: $user.firstName)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                        
                        TextField("Last Name", text: $user.lastName)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                            .autocorrectionDisabled()

                        
                        TextField("Email", text: $user.email)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)

                        VStack {
                            SecureField("Password", text: $user.password)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(10)
                                .autocorrectionDisabled()
                            
                            Text("Password should be atleast 7 characters")
                                .font(.system(size: 10.2))
                                .foregroundColor(.blue)
                        }
                    }
                    .offset(y:-15)
                    
                    VStack {
                        SokiButton(title: "Create Account", height: 40, width: 300, color: Constants.COLOR) {
                            user.signup()
                        }
                    }
                }
            }
                    
        
        }
    }
}

#Preview {
    SignupView()
}
