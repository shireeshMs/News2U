//
//  ArticleListViewController+UITableViewDataSourcePrefetching.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit

extension ArticleListViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let tvShowViewModels: [ArticleCellViewModel] = viewModel?.tvShowCellViewModels else { return }
        var number = 1
        let shouldFetchRemoteData: Bool = indexPaths.contains { (indexPath) -> Bool in
            // If there is 5 more rows to go, than start fetching data from remote
            number = indexPath.row
            return indexPath.row == tvShowViewModels.count - 5
        }
        if shouldFetchRemoteData && number < 16 {
            // just to have lot of data without pagination as news api doesnt have page
            viewModel?.fetchTVShows(shouldApplyPagination: true, page: number)
        }
    }
    
}
