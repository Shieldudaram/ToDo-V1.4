//
//  AddTaskView.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TaskViewModel

    @State private var taskName: String = ""
    @State private var taskPoints: String = "1"
    @State private var checkboxCount: String = "1"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Name", text: $taskName)
                    
                    TextField("Points", text: $taskPoints)
                        .keyboardType(.numberPad)
                    
                    TextField("Number of Checkboxes", text: $checkboxCount)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Button("Add Task") {
                        addTask()
                    }
                    .disabled(taskName.isEmpty || taskPoints.isEmpty || checkboxCount.isEmpty)
                }
            }
            .navigationBarTitle("New Task", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
        }
    }
    
    private func addTask() {
        if let points = Int(taskPoints), let checkboxes = Int(checkboxCount) {
            viewModel.addTask(name: taskName, points: points, checkboxes: checkboxes)
            dismiss()
        }
    }
}
