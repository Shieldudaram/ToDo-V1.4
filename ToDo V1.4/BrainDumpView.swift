//
//  BrainDumpView.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/22/24.
//

import SwiftUI

struct BrainDumpView: View {
    @Binding var brainDumpWords: [String]
    @State private var currentWord = ""
    var onMainScreen: () -> Void

    var body: some View {
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

            // TextField for entering new words, now above the menu button
            TextField("Enter a word...", text: $currentWord, onCommit: addWord)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)  // Adjust padding to move it closer to the menu button

            // Button to return to the main screen
            Button(action: onMainScreen) {
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
        .background(Color.blue.edgesIgnoringSafeArea(.all))
    }

    private func addWord() {
        guard !currentWord.isEmpty else { return }
        brainDumpWords.append(currentWord)
        currentWord = ""
    }
}
