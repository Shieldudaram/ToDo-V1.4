//
//  ContentView.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    // Define the app's blue background color
    private let backgroundColor = Color.blue

    var body: some View {
        ZStack {
            // Set the background color
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Points: 0")  // Placeholder for points section
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("Peasant")  // Placeholder for ranking section
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
                Spacer()
                
                // Buttons for navigation
                VStack(spacing: 20) {
                    Button(action: {
                        // Handle navigation to Daily List
                    }) {
                        Text("Daily List")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Handle navigation to Brain Dump
                    }) {
                        Text("Brain Dump")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Handle navigation to Priority Window
                    }) {
                        Text("Priority Window")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Handle navigation to Time Block
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
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
