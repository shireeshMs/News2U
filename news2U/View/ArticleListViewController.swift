//
//  ArticleListViewController.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 27.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import UIKit

final class ArticleListViewController: UIViewController,ViewModelController {
    
    typealias ViewModelType = ArticleListViewModel
   
    var viewModel: ViewModelType!
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public  Variables
   
    
    // MARK: - Methods
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "MovieListingCell", bundle: nil), forCellReuseIdentifier: "MovieListingCell")
    }
    
}

// MARK: - Lifecycle
extension ArticleListViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        viewModel.fetchTVShows()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tvShowViewModel = ArticleListViewModel(tvShowInteractor: self)
//        tvShowViewModel = ArticleListViewModel(tvShowInteractor: self, coordinator: self.coordinator!)
        print("Result \(self.viewModel.tvShowCellViewModels.count)")
        print("Result\(self.viewModel.tvShowContainer?.articles)")
//        self.viewModel = ArticleListViewModel(tvShowInteractor: <#T##TVShowInteractor#>, coordinator: <#T##AllArticlesListCoordinator#>)
        initTableView()
    }
    
}
