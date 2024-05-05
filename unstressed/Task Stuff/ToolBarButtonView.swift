//
//  ToolBarButtonView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/4/24.
//

import SwiftUI

struct ToolBarButtonView: View {
    @State var showNewTask:Bool
    
    var body: some View {
        HStack(spacing:1) {
            Button {
                showNewTask.toggle()
            } label: {
                Image(systemName: "plus")
                    .padding(11)
                    .background(
                        Circle()
                            .scaledToFit()
                            .foregroundColor(Constants.MEDIUM_COLOR)
                            .shadow(radius: 15)
                    )
                    .foregroundColor(.white)
                    .bold()
            }
            .sheet(isPresented: $showNewTask, content: {
                AddTaskView(task:TaskModel()) {
                    showNewTask.toggle()
                }
                .presentationCornerRadius(45)
            })
            
            Button {
                UserViewModel.getInstance().signout();
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .padding(10)
                    .background(
                        Circle()
                            .foregroundColor(Constants.MEDIUM_COLOR)
                            .shadow(radius: 15)
                    )
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    ToolBarButtonView(showNewTask: true)
}
