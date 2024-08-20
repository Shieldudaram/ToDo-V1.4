//
//  TaskViewModel.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/20/24.
//

import SwiftUI
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(name: String, points: Int, checkboxes: Int) {
        let newTask = Task(name: name, points: points, isCompleted: Array(repeating: false, count: checkboxes))
        tasks.append(newTask)
    }

    func toggleTaskCompletion(task: Task, atIndex index: Int) {
        if let taskIndex = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[taskIndex].isCompleted[index].toggle()
        }
    }

    func calculateTotalScore() -> Int {
        return tasks.reduce(0) { total, task in
            let completedPoints = task.isCompleted.filter { $0 }.count * task.points
            return total + completedPoints
        }
    }

    func getMedievalTitle() -> String {
        let score = calculateTotalScore()
        switch score {
        case 0...20: return "Peasant"
        case 21...40: return "Squire"
        case 41...60: return "Knight"
        case 61...80: return "Baron"
        case 81...99: return "Duke"
        default: return "Lord"
        }
    }
}
