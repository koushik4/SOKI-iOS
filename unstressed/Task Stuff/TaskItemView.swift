//
//  TaskView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import SwiftUI

struct TaskItemView: View {
    var category:Category
    
    var body: some View {
        TaskListView
        
    }
    
    var TaskListView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(radius:8)
                .frame(width: UIScreen.main.bounds.width * 8.5/10, height: 100)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Title")
                    .font(.system(size: 25))
                    .frame(alignment: .leading)
                    .padding(.trailing, UIScreen.main.bounds.width * 6.3/10)
                    .foregroundColor(Constants.DARKER_COLOR)
                HStack(spacing:120) {
                    AssignView
                    Text("24th May")
                        .font(.system(size: 12))
                        .foregroundColor(Constants.DARKER_COLOR)
                    
                }
            }
        }
    }
    
    var AssignView: some View {
        HStack(spacing: 2) {
            PersonView(title: "name")
            Text("->")
            PersonView(title: "other_name")
        }
    
    }
    
    
    func PersonView(title:String) -> some View {
        Text(title)
            .padding(4)
            .font(.system(size: 12))
            .foregroundColor(Constants.DARKER_COLOR)
        .background {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray.opacity(0.15))
                .shadow(radius:5)
        }
        .padding(0)
    }
}




#Preview {
    TaskItemView(category: Category.home)
}
