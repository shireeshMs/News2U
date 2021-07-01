//
//  ArticleCellViewModel.swift

//

import Foundation

class ArticleCellViewModel {
    
    private let article: Article
    
    var name: String? {
        get {
            return article.author
        }
    }
    
    var title: String? {
        get {
            return article.title
        }
    }
    
    var description: String? {
        get {
            return article.description
        }
    }
    
    var imageUrl: String? {
        get {
            return article.urlToImage
        }
    }
    
    var voteDescription: String? {
        get {
            return "\(article.publishedAt?.description) total votes)"
        }
    }
    
    init(tvShow: Article) {
        self.article = tvShow
    }
    
}
