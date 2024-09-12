import SwiftUI

struct PriorityWindowView: View {
    var brainDumpWords: [String]
    var onMainScreen: () -> Void
    @State private var selectedSection: String?
    @Binding var sortedTerms: [String: [String]] // a dictionary to hold sorted terms

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(brainDumpWords, id: \.self) { word in
                        Text(word)
                            .padding(8)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            .foregroundColor(.black)
                            .onTapGesture {
                                if let section = selectedSection {
                                    sortedTerms[section, default: []].append(word)
                                }
                            }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()

            HStack(spacing: 10) {
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        PrioritySection(label: "Need & Now", color: .red, isSelected: selectedSection == "Need & Now")
                            .onTapGesture {
                                selectedSection = "Need & Now"
                            }
                        PrioritySection(label: "Need & Later", color: .blue, isSelected: selectedSection == "Need & Later")
                            .onTapGesture {
                                selectedSection = "Need & Later"
                            }
                    }
                    HStack(spacing: 10) {
                        PrioritySection(label: "Want & Now", color: .green, isSelected: selectedSection == "Want & Now")
                            .onTapGesture {
                                selectedSection = "Want & Now"
                            }
                        PrioritySection(label: "Want & Later", color: .yellow, isSelected: selectedSection == "Want & Later")
                            .onTapGesture {
                                selectedSection = "Want & Later"
                            }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
            }
            .padding()

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

#Preview {
    PriorityWindowView(brainDumpWords: ["Example"], onMainScreen: {}, sortedTerms: .constant([:]))
}