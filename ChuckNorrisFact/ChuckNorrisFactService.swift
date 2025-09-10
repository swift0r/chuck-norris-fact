import Foundation

protocol ChuckNorrisFactServiceProtocol {
    func fetchRandomFact() async throws -> String
}

class ChuckNorrisFactService: ChuckNorrisFactServiceProtocol {
    func fetchRandomFact() async throws -> String {
        let url = URL(string: "https://api.chucknorris.io/jokes/random")!
        let (data, _) = try await URLSession.shared.data(from: url)

        guard
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let fact = json["value"] as? String
        else {
            throw NSError(
                domain: "ChuckNorrisFactService",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Failed to parse fact."]
            )
        }
        return fact
    }
}
