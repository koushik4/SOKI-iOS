//
//  AddTaskView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import SwiftUI

struct TaskViewer: View {
    @ObservedObject var task:TaskModel
    @State var addNewTask: Bool = false
    
    var action: ()->Void;
    
    var body: some View {
        ZStack {
            Color(Constants.GRAY_BG)

            VStack(spacing: 20) {

                TextField("Title", text: $task.title)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width-30, height: 60)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(30)
                
                TextField("Description", text: $task.description, axis: .vertical)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width-30)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(30)
                    .lineLimit(5, reservesSpace: true)
                    .padding(.top, 20)
                
                DatePicker("Deadline", selection: $task.timestamp, in: Date()...)
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding()
                        .tint(Constants.COLOR)
                
                HStack {
                    Text("Category:")
                    Picker("category", selection: $task.category) {
                        ForEach(Constants.selectionItems,id: \.self) {category in
                            Text(category)
                                .foregroundColor(Constants.COLOR)
                                .font(.system(size: 18))
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .accentColor(Constants.MEDIUM_COLOR)
                }
                .padding(.leading, 17)
                
                Text("Assign to: \(task.assigneeFirstName)")
                    .padding()
                    .frame(width: UIScreen.main.bounds.width-30, height: 50)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(30)
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                SokiButton(title: "Complete", height: 45, width: 330, color: Constants.BTN_BG) {
                    task.addTaskToDb()
                    action();
                }
                .padding(.top, 60)
                
                Spacer()
            }
            .padding(45)
            
        }
        
    }
}

#Preview {
    TaskViewer(task:TaskModel(category: Category.personal.rawValue)) {
        
    }
}
