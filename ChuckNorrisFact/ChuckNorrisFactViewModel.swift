import Foundation

class ChuckNorrisFactViewModel: ObservableObject {
    @Published var fact: String = "Loading..."
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    private let service: ChuckNorrisFactServiceProtocol
    
    init(service: ChuckNorrisFactServiceProtocol = ChuckNorrisFactService(), autoFetch: Bool = true) {
        self.service = service
        if autoFetch {
            loadInitialFact()
        }
    }
    
    private func loadInitialFact() {
        Task {
            await fetchFact()
        }
    }

    @MainActor
    func fetchFact() async {
        isLoading = true
        errorMessage = nil
        do {
            fact = try await service.fetchRandomFact()
        } catch {
            errorMessage = "Failed to load fact: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
