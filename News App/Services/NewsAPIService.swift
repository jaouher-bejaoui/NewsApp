import Foundation

struct NewsAPIService {
    private let apiKey = "3e6043b17c8f4a75b9293ba3dc7708da"
    
    func fetchArticles(query: String = "") async throws -> [Article] {
        var components = URLComponents(string: "https://newsapi.org/v2/top-headlines")!
        components.queryItems = [
            URLQueryItem(name: "country", value: "us"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ]
        if !query.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "q", value: query))
        }

        let (data, _) = try await URLSession.shared.data(from: components.url!)
        let response = try JSONDecoder().decode(ArticlesResponse.self, from: data)
        return response.articles
    }
}

struct ArticlesResponse: Codable {
    let articles: [Article]
}
