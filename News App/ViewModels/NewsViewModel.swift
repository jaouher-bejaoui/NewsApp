import Foundation
import Combine

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var searchText = ""

    private var cancellables = Set<AnyCancellable>()
    private let service = NewsAPIService()

    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                Task {
                    await self?.fetchArticles(query: query)
                }
            }
            .store(in: &cancellables)
    }

    func fetchArticles(query: String = "") async {
        do {
            self.articles = try await service.fetchArticles(query: query)
        } catch {
            print("Failed to fetch articles: \(error)")
        }
    }
}