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
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fit)
                }
                Text(article.title)
                    .font(.title)
                    .bold()
                if let description = article.description {
                    Text(description)
                        .font(.body)
                }
                Link("Lire l'article complet", destination: URL(string: article.url)!)
                    .padding(.top, 10)
            }
            .padding()
        }
        .navigationTitle("Détails")
        .navigationBarTitleDisplayMode(.inline)
    }
}