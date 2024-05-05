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

    @State var showNewTask: Bool = false;
    
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
                            // TODO: change
                            TaskPageView(activeTab: Category.family.rawValue)
                        } label: {
                            HomeCardView(imageResource: .family, title: "Family")
                        }

                    
                        NavigationLink {
                            // TODO: change
                            TaskPageView(activeTab: Category.personal.rawValue)
                        } label: {
                            HomeCardView(imageResource: .personal, title: "Personal")
                        }
                        
                    }
                    HStack(spacing: hSpace) {
                        NavigationLink {
                            TaskPageView(activeTab: Category.work.rawValue)

                        } label: {
                            HomeCardView(imageResource: .work, title: "Work")
                        }
                        
                        NavigationLink {
                            TaskPageView(activeTab: Category.misc.rawValue)

                        } label: {
                            HomeCardView(imageResource: .misc, title: "Miscellaneous")
                        }
                        
                    }
                }
                .toolbar(content: {
                    ToolBarButtonView(showNewTask: showNewTask)
                })
            }
        }
    }
}

#Preview {
    HomePageView()
}
