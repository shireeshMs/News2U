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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
}
