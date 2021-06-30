//
//  ArticleListViewController+UITableViewDataSource.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit

extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvShowViewModel?.tvShowCellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tvShowView = tableView.dequeueReusableCell(withIdentifier: "MovieListingCell") as! MovieListingCell
        let tvShowViewModels = tvShowViewModel?.tvShowCellViewModels
        let currentIndex = indexPath.row
        let tvShowCellViewModel = tvShowViewModels?[currentIndex]
        tvShowView.tvShowViewModel = tvShowCellViewModel
        return tvShowView
    }
    
}
