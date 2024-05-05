//
//  AddTaskButton.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/4/24.
//

import SwiftUI

struct AddTaskButton: View {
    @State var showNewTask = false
    var action: () -> Void
    var body: some View {
        Button {

        } label: {
            Image(systemName: "plus")
                .padding(11)
                .background(
                    Circle()
                        .scaledToFit()
                        .foregroundColor(Constants.MEDIUM_COLOR)
                )
                .foregroundColor(.white)
                .bold()
        }
    }
}

#Preview {
    AddTaskButton() {
        
    }
}
