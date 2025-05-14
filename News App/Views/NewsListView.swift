import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
	
	@State private var isFlipped = false

    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
					ArticleRow(article: article)
				}
				

			}
			.overlay(Group {
				if viewModel.articles.isEmpty {
					ProgressView()
				}
			})
	        .searchable(text: $viewModel.searchText)
            .navigationTitle("News")
            .task {
                await viewModel.fetchArticles()
            }
        }
    }
}
