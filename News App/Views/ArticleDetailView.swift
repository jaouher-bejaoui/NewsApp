import SwiftUI

struct ArticleDetailView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let urlString = article.urlToImage, let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
						ProgressView()
                    }
					.cornerRadius(8)
                    .aspectRatio(contentMode: .fit)
                }
                Text(article.title)
                    .font(.title)
                    .bold()
                if let description = article.description {
                    Text(description)
                        .font(.body)
                }
                Link("Read full article", destination: URL(string: article.url)!)
                    .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	ArticleDetailView(article: Article(title: "title",
									   description: "desc",
									   url: "http://www.domain.com",
									   urlToImage:  "https://img.etimg.com/thumb/msid-120895674,width-1200,height-630,imgsize-1438895,overlay-economictimes/articleshow.jpg",
									   publishedAt: "2025-05-05T09:22:52Z"))
}
