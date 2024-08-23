//
//  PriorityWindowView.swift
//  ToDo V1.4
//
//  Created by Chris Jennison on 8/22/24.
//

import SwiftUI

struct PriorityWindowView: View {
    var brainDumpWords: [String]
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
}
