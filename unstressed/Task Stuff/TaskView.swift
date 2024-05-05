//
//  TaskView.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/3/24.
//

import SwiftUI

struct TaskView: View {
    let category:Category
    @State var showNewTask = false
    @ObservedObject var taskFetcher:TaskFetcher = TaskFetcher.getInstance()
    
    @State var check:Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(Constants.COLOR)
                    .ignoresSafeArea()
                
                VStack(spacing:20) {
                    HStack {
                        Text("My Tasks")
                            .font(.custom("IrishGrover-Regular", size: 46))
                            .foregroundColor(Constants.DARKER_COLOR)
                    }
                    
                    ScrollView {
                        VStack(spacing:12) {
                            ForEach(0..<taskFetcher.items.count, id: \.self){i in
                                if taskFetcher.items[i].0.taskModel.category == category.rawValue {
                                    Button {
                                        taskFetcher.items[i].1 = true
                                    } label: {
                                        taskFetcher.items[i].0
                                    }
                                    .sheet(isPresented: $taskFetcher.items[i].1 , content: {
                                        TaskViewer(task:taskFetcher.items[i].0.taskModel) {
                                        }
                                        .presentationCornerRadius(45)
                                    })
                                
                                    .contextMenu(ContextMenu(menuItems: {
                                        Button {
                                            taskFetcher.deleteIndex(i: i)
                                        } label: {
                                            Label("Complete", systemImage: "checkmark.gobackward")
                                        }
                                    }))
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
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
    TaskView(category: .family)
}
