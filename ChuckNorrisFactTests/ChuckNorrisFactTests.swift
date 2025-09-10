import Testing
@testable import ChuckNorrisFact

struct MockChuckNorrisFactService: ChuckNorrisFactServiceProtocol {
    var result: Result<String, Error>

    func fetchRandomFact() async throws -> String {
        switch result {
        case .success(let fact): return fact
        case .failure(let error): throw error
        }
    }
}

struct ChuckNorrisFactTests {
    @Test func testInitialState() async throws {
        let mockService = MockChuckNorrisFactService(result: .success("Mock Fact"))
        let viewModel = ChuckNorrisFactViewModel(service: mockService, autoFetch: false)

        #expect(viewModel.fact == "Loading...")
        #expect(viewModel.errorMessage == nil)
        #expect(!viewModel.isLoading)
    }

    @Test func testFactLoadedSuccessfully() async throws {
        let mockService = MockChuckNorrisFactService(result: .success("Mock Fact"))
        let viewModel = ChuckNorrisFactViewModel(service: mockService, autoFetch: false)
        await viewModel.fetchFact()

        #expect(viewModel.fact == "Mock Fact")
        #expect(viewModel.errorMessage == nil)
        #expect(!viewModel.isLoading)
    }

    @Test func testFactLoadError() async throws {
        struct TestError: Error {}
        let mockService = MockChuckNorrisFactService(result: .failure(TestError()))
        let viewModel = ChuckNorrisFactViewModel(service: mockService, autoFetch: false)
        await viewModel.fetchFact()

        #expect(viewModel.errorMessage?.contains("Failed to load fact") == true)
        #expect(viewModel.fact == "Loading...")
        #expect(!viewModel.isLoading)
    }
}
