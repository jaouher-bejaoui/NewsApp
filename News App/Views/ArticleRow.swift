import SwiftUI

struct ArticleRow: View {
	let article: Article
	
	var body: some View {
		HStack(alignment: .top) {
			if let urlString = article.urlToImage, let url = URL(string: urlString) {
				AsyncImage(url: url) { image in
					image.resizable()
				} placeholder: {
					ProgressView()
				}
				.frame(width: 100, height: 100)
				.cornerRadius(8)
			}
			Spacer()
			VStack(alignment: .leading) {
				Text(article.title)
					.font(.headline)
				if let description = article.description {
					Text(description)
						.font(.subheadline)
						.foregroundColor(.secondary)
						.lineLimit(2)
				}
			}
		}.frame(width: .infinity)
	}
}

#Preview {
	ArticleRow(article: Article(title: "title",
								description: "desc",
								url: "http://www.domain.com",
								urlToImage:  "https://img.etimg.com/thumb/msid-120895674,width-1200,height-630,imgsize-1438895,overlay-economictimes/articleshow.jpg",
								publishedAt: "2025-05-05T09:22:52Z"))
}
