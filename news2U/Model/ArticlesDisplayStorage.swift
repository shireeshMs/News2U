//
//  ArticlesDisplayStorage.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

struct ArticlesCache {
  let ArticleArray: [Articles]
  let ArticleDictionary: [String: Articles]
}

// Provides kanji data from JSON
class ArticlesDisplayStorage {
  static let newsURL = Bundle.main.url(forResource: "Response", withExtension: "JSON")!
  private let allArticlesFromJSON: ArticlesCache
  
  init() {
    // Parse json and store it's data
    let data = try! Data(contentsOf: ArticlesDisplayStorage.newsURL)
    let allArticles = try! JSONDecoder().decode([Articles].self, from: data)
    
    let articleDictionary = allArticles.reduce([:]) { (dictionary, articles) -> [String: Articles] in
      var dictionary = dictionary
      dictionary[articles.author] = articles
      return dictionary
    }
    
    // Save new cache
    allArticlesFromJSON = ArticlesCache(ArticleArray: allArticles, ArticleDictionary: articleDictionary)
  }
  
  func allArticles() -> [Articles] {
    return allArticlesFromJSON.ArticleArray
  }
  
  func ArticleForWord(_ word: String) -> [Articles] {
    let ArticleInWord: [Articles] = word.compactMap { (character) -> Articles? in
      let ArticleForCharacter = allArticlesFromJSON.ArticleDictionary["\(character)"]
      return ArticleForCharacter
    }
    return ArticleInWord
  }
}
