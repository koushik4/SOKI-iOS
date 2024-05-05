//
//  HomePageView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/2/24.
//

import SwiftUI

struct HomePageView: View {
    let vSpace:CGFloat = 72;
    let hSpace:CGFloat = 35;

    @State var active: Bool = false;
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Constants.COLOR)
                    .ignoresSafeArea()
                VStack(spacing: vSpace) {
                    Text("Home")
                        .font(.custom("IrishGrover-Regular", size: 46))
                        .foregroundColor(Constants.DARKER_COLOR)
                    
                    
                    HStack(spacing: hSpace) {
                        NavigationLink {
                            SignupView()
                        } label: {
                            HomeCardView(action: {
                                
                            }, imageResource: .family, title: "Family")
                        }

                    
                        NavigationLink {
                            SignupView()
                        } label: {
                            HomeCardView(action: {
                                
                            }, imageResource: .personal, title: "Personal")
                        }
                        
                    }
                    HStack(spacing: hSpace) {
                        NavigationLink {
                            SignupView()
                        } label: {
                            HomeCardView(action: {
                                
                            }, imageResource: .work, title: "Work")
                        }
                        
                        NavigationLink {
                            SignupView()
                        } label: {
                            HomeCardView(action: {
                                
                            }, imageResource: .misc, title: "Miscellaneous")
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    HomePageView()
}
