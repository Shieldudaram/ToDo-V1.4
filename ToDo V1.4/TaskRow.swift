//
//  TaskRow.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
    var viewModel: TaskViewModel
    var onDelete: () -> Void // Closure for handling deletion

    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleTaskCompletion(task: task, atIndex: 0)
            }) {
                Image(systemName: task.isCompleted.first == true ? "checkmark.square.fill" : "square")
                    .foregroundColor(task.isCompleted.first == true ? .green : .white)
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text(task.name)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("\(task.points) pts")
                .foregroundColor(.yellow)
            
            Button(action: onDelete) { // Button for deleting the task
                Image(systemName: "xmark.circle")
                    .foregroundColor(.red)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.horizontal, 20)
        .background(Color.clear)
    }
}

