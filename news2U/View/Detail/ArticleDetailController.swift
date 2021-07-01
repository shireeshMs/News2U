//
//  HomeDetailController.swift
//  Coordinator
//
//  Created by Giulio Lombardo on 17/01/2019.
//
//  MIT License
//
//  Copyright (c) 2019 Giulio Lombardo
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

import UIKit
import Kingfisher
final class ArticleDetailController: UIViewController, ViewModelController {
	typealias ViewModelType = ArticleDetailViewModel

	var viewModel: ViewModelType!

    @IBOutlet var articleLikes: UILabel!
    @IBOutlet var articleContent: UILabel!
    @IBOutlet var articleDesc: UILabel!
    @IBOutlet var articleTItle: UILabel!
    @IBOutlet var articleImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Content \(viewModel.tvShowContainer?.voteDescription.debugDescription)")
        print("description \(viewModel.tvShowContainer?.description.debugDescription)")
        print("title \(viewModel.tvShowContainer?.title.debugDescription)")
        print("urlToImage \(viewModel.tvShowContainer?.imageUrl.debugDescription)")
        print("tvShowContainer \(viewModel.tvShowContainer)")

        articleContent.text = viewModel.tvShowContainer?.voteDescription
        articleDesc.text = viewModel.tvShowContainer?.description
        articleTItle.text = viewModel.tvShowContainer?.title
        articleLikes.text = viewModel.tvShowContainer?.name
        articleImage.kf.base.startAnimating()
        let processor = DownsamplingImageProcessor(size: articleImage.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        articleImage.kf.setImage(
            with: URL(string: viewModel.tvShowContainer?.imageUrl ?? ""),
            placeholder: UIImage(named: "ic_popular"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
//        articleImage.kf.setImage(with: URL(string: viewModel.tvShowContainer?.imageUrl ?? "") )
        // Do any additional setup after loading the view.
    }
}
