//
//  TaskRow.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import SwiftUI

struct TaskRow: View {
    @ObservedObject var task: Task
    var viewModel: TaskViewModel

    var body: some View {
        HStack {
            // Loop through the checkboxes and display each one
            ForEach(0..<task.isCompleted.count, id: \.self) { index in
                Button(action: {
                    viewModel.toggleTaskCompletion(task: task, atIndex: index)
                }) {
                    Image(systemName: task.isCompleted[index] ? "checkmark.square.fill" : "square")
                        .foregroundColor(task.isCompleted[index] ? .green : .white)
                }
                .buttonStyle(BorderlessButtonStyle())
            }

            Text(task.name)
                .foregroundColor(.white)

            Spacer()

            Text("\(task.points * task.isCompleted.filter { $0 }.count) pts")
                .foregroundColor(.yellow)
        }
        .padding(.horizontal, 20)
        .background(Color.clear)
    }
}
