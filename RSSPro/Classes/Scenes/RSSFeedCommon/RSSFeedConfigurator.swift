//
//  ThumbnailRSSFeedConfigurator.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

class RSSFeedConfigurator
{
    static func configure(view: RSSFeedViewProtocol)
    {
        let viewModel = RSSFeedViewModel(networkManager: NetworkLayer,
                                                  view: view)
        view.viewModel = viewModel as RSSFeedViewModelProtocol
    }
}
