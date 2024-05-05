//
//  ItemView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        ZStack {
           
            TabView {
                Color(Constants.COLOR)
                    .tabItem {
                        Label("house", systemImage: "house")
                    }
                
                Color(Constants.COLOR)
                    .tabItem {
                        Label("house", systemImage: "house")
                    }
                
            }
            .accentColor(.red)
            .toolbarColorScheme(.dark, for: .bottomBar)
            .background(.yellow)
            .toolbarTitleMenu {
                Text("kou")
            }
        }
    
    }
}

#Preview {
    ItemView()
}
