//
//  ContentView.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/19/24.
//
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()

    @State private var showDailyList = false
    @State private var showBrainDump = false
    @State private var showPriorityWindow = false
    @State private var showTimeBlock = false
    @State private var showAddTaskSheet = false

    private let backgroundColor = Color.blue

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            if showDailyList {
                dailyListView
            } else if showBrainDump {
                brainDumpView
            } else if showPriorityWindow {
                priorityWindowView
            } else if showTimeBlock {
                timeBlockView
            } else {
                mainScreen
            }
        }
        .sheet(isPresented: $showAddTaskSheet) {
            AddTaskView(viewModel: viewModel)
        }
    }
    
    var mainScreen: some View {
        VStack {
            Text("Points: \(viewModel.calculateTotalScore())")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text(viewModel.getMedievalTitle())
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 10)
            
            Spacer()
            
            VStack(spacing: 20) {
                Button(action: {
                    showDailyList = true
                }) {
                    Text("Daily List")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    showBrainDump = true
                }) {
                    Text("Brain Dump")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    showPriorityWindow = true
                }) {
                    Text("Priority Window")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    showTimeBlock = true
                }) {
                    Text("Time Block")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
    }
    
    var dailyListView: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    showAddTaskSheet = true
                }) {
                    Text("Add Task")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding([.leading, .top], 16)
                
                Spacer()
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.tasks) { task in
                        TaskRow(task: task, viewModel: viewModel)
                    }
                }
                .padding(.top, 20)
            }
            
            Spacer()
            
            Button(action: resetView) {
                Text("Main Screen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }
    
    var brainDumpView: some View {
        VStack {
            // Placeholder for Brain Dump content
            
            Spacer()
            
            Button(action: resetView) {
                Text("Main Screen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }
    
    var priorityWindowView: some View {
        VStack {
            // Placeholder for Priority Window content
            
            Spacer()
            
            Button(action: resetView) {
                Text("Main Screen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }
    
    var timeBlockView: some View {
        VStack {
            // Placeholder for Time Block content
            
            Spacer()
            
            Button(action: resetView) {
                Text("Main Screen")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 50)
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }
    
    private func resetView() {
        showDailyList = false
        showBrainDump = false
        showPriorityWindow = false
        showTimeBlock = false
    }
}

#Preview {
    ContentView()
}
