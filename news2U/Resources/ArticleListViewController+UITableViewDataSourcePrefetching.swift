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
        guard let tvShowViewModels: [ArticleCellViewModel] = tvShowViewModel?.tvShowCellViewModels else { return }
        let shouldFetchRemoteData: Bool = indexPaths.contains { (indexPath) -> Bool in
            // If there is 5 more rows to go, than start fetching data from remote
            indexPath.row == tvShowViewModels.count - 5
        }
        if shouldFetchRemoteData {
            tvShowViewModel?.fetchTVShows(shouldApplyPagination: true)
        }
    }
    
}
