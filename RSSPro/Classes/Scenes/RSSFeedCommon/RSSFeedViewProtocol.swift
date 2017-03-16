//
//  RSSFeedViewProtocol.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 15.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

protocol RSSFeedViewProtocol: class
{
    var viewModel: RSSFeedViewModelProtocol! { get set }
    func display(title: String,
                 message: String)
}
