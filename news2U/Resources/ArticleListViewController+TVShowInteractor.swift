//
//  ArticleListViewController+Interactions.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation

extension ArticleListViewController: TVShowInteractor {
    
    func shouldUpdateTableView() {
        tableView.reloadData()
    }
    
}
