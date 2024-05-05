//
//  TaskPageView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import SwiftUI

struct TaskPageView: View {
    @State var activeTab:String
    
    var body: some View {
        NavigationView {
            TabView(selection: $activeTab) {
                TaskView(category: .family)
                    .tabItem {
                        Text("Family")
                        Image(systemName: "house")
                    }
                    .tag(Category.family.rawValue)
                
                TaskView(category: .personal)
                    .tabItem {
                        Text("Personal")
                        Image(systemName: "person")
                    }
                    .tag(Category.personal.rawValue)
                
                TaskView(category: .work)
                    .tabItem {
                        Text("Work")
                        Image(systemName: "case")
                    }
                    .tag(Category.work.rawValue)
                
                TaskView(category: .misc)
                    .tabItem {
                        Text("Misc")
                        Image(systemName: "rectangle.portrait.on.rectangle.portrait.fill")
                    }
                    .tag(Category.misc.rawValue)
            }
            .accentColor(Constants.MEDIUM_COLOR)
        }
    }
}

#Preview {
    TaskPageView(activeTab: Constants.PERSONAL_TAG)
}
