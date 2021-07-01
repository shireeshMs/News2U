//
//  MovieListingCell.swift
//  MVVM-C-App-Core-Networking
//
//  Created by Oguz Parlak on 30.06.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListingCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    var tvShowViewModel: ArticleCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI() {
        // Bind labels
        titleLabel.text = tvShowViewModel?.title
        overviewLabel.text = tvShowViewModel?.name
//        voteLabel.text = tvShowViewModel?.voteDescription
        // Bind Image
        let posterPath = tvShowViewModel?.imageUrl
        let processor = DownsamplingImageProcessor(size: posterImageView.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        posterImageView.kf.setImage(
            with: URL(string: posterPath ?? ""),
            placeholder: UIImage(named: "ic_popular"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        posterImageView.kf.indicatorType = .activity
    }

}
