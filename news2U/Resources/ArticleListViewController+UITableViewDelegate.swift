//
//  TVShowListView+UITableViewDelegate.swift
//  news2U
//
//  Created by PiancaSiri on 30/06/21.
//

import Foundation
import UIKit

extension ArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
       let viewModelCell = self.viewModel.tvShowCellViewModels[indexPath.row]

        self.viewModel.showDetail(for: self.viewModel.tvShowCellViewModels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
