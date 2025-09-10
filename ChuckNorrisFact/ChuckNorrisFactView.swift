import SwiftUI

struct ChuckNorrisFactView: View {
    @StateObject private var viewModel = ChuckNorrisFactViewModel()

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            QuoteView(text: viewModel.errorMessage ?? viewModel.fact)
            Spacer()
            RefreshButton(isLoading: viewModel.isLoading) {
                Task {
                    await viewModel.fetchFact()
                }
            }
        }
        .padding()
    }
}

private struct QuoteView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.title2)
            .italic()
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color(.systemGray6)))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.accentColor, lineWidth: 2))
            .multilineTextAlignment(.center)
            .animation(.easeInOut, value: text)
    }
}

private struct RefreshButton: View {
    let isLoading: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            if isLoading {
                ProgressView()
            } else {
                Text("Refresh Fact")
                    .bold()
            }
        }
        .disabled(isLoading)
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ChuckNorrisFactView()
}
