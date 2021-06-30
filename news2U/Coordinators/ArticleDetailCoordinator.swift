//
//  ArticleDetailCoordinator.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import UIKit

//class ArticleDetailCoordinator: Coordinator, ArticleDetailViewControllerDelegate {
//    var childCoordinators: [Coordinator]
//    
//    var navigationController: UINavigationController
//    
//  private let presenter: UINavigationController  // 1
//  private var articleDetailViewController: ArticleDetailViewController? // 2
////  private let articleStorage: ArticlesDisplayStorage  // 4
//  private let article: Article  // 5
//  
//  init(presenter: UINavigationController,
//       article: Article) {
//    
//    self.article = article
//    self.presenter = presenter
//    self.navigationController = presenter
//    self.childCoordinators =  
////    self.articleStorage = articleStorage  // 6
//  }
//  
//  func start() {
//    let articleDetailViewController = ArticleDetailViewController(nibName: nil, bundle: nil)
//    articleDetailViewController.delegate = self
//    articleDetailViewController.title = "Kanji details"
//    articleDetailViewController.selectedArticles = article    // 7
//    
//    presenter.pushViewController(articleDetailViewController, animated: true)
//    self.articleDetailViewController = articleDetailViewController  // 8
//  }
//}
