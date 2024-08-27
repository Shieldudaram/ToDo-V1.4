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

    @State private var brainDumpWords: [String] = []

    private let backgroundColor = Color.blue

    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            if showDailyList {
                dailyListView
            } else if showBrainDump {
                BrainDumpView(brainDumpWords: $brainDumpWords, onMainScreen: resetView)
                
            } else if showPriorityWindow {
                PriorityWindowView(brainDumpWords: brainDumpWords, onMainScreen: resetView)
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
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showAddTaskSheet = true
                }) {
                    Text("Add Task")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing, .top], 16)
                Spacer()
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.tasks) { task in
                        TaskRow(task: task, viewModel: viewModel) {
                            viewModel.deleteTask(task: task)
                        }
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

    
    var priorityWindowView: some View {
        VStack {
            // Display the words at the top of the screen with a background color
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(brainDumpWords, id: \.self) { word in
                        Text(word)
                            .padding(8)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
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
