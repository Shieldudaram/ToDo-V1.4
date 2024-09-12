import SwiftUI

extension ContentView {
    var priorityWindowView: some View {
        VStack {
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

            HStack(spacing: 10) {
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        PrioritySection(label: "Need & Now", color: .red)
                        PrioritySection(label: "Need & Later", color: .blue)
                    }
                    HStack(spacing: 10) {
                        PrioritySection(label: "Want & Now", color: .green)
                        PrioritySection(label: "Want & Later", color: .yellow)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
            }
            .padding()

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
}