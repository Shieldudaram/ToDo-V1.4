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

    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleTaskCompletion(task: task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                    .foregroundColor(task.isCompleted ? .green : .white)
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Text(task.name)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("\(task.points) pts")
                .foregroundColor(.yellow)
        }
        .padding(.horizontal, 20)
        .background(Color.clear)
    }
}
