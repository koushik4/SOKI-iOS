//
//  TaskView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import SwiftUI

struct TaskItemView: View {
    var uid: UUID = UUID()
    @ObservedObject var taskModel:TaskModel
    @State var toggle = false
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text(taskModel.title)
                    .font(.system(size: 18))
                    .foregroundColor(Constants.DARKER_COLOR)
                
                HStack(spacing:200) {
                    AssignView
                    Text(taskModel.dateFromMilliseconds())
                        .font(.system(size: 12))
                        .foregroundColor(Constants.DARKER_COLOR)
                    
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width-32)

            .padding(8)
            .padding(0)
            .background {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Constants.GRAY_BG)
                    .shadow(color:.black.opacity(0.5), radius:8)
                    .frame(maxWidth: UIScreen.main.bounds.width-25)
                
            }
    }

    var AssignView: some View {
        HStack(spacing: 2) {
            PersonView(title: taskModel.assigneeFirstName)
            Text("->")
            PersonView(title: taskModel.assignerFirstName)
        }
    }
    
    func PersonView(title:String) -> some View {
        Text(title)
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
    TaskItemView(taskModel: TaskModel().title(title: "Make me ").assigneeFirstName(email: "Koushik").assignerFirstName(email: "anisha"))
}
