//
//  ThumbnailRSSFeedViewController.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

class ThumbnailRSSFeedViewController: UIViewController, RSSFeedViewProtocol
{
    var viewModel: RSSFeedViewModelProtocol! {
        didSet {
            self.viewModel.rssFeedItemsDidChange = { [weak self] in
                self?.tableViewContent.reloadData()
            }
        }
    }
    @IBOutlet var tableViewContent: UITableView!
    
    //MARK: - Object lifecycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        RSSFeedConfigurator.configure(view: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        viewModel.reloadData()
    }
    
    //MARK: - IBActions
    @IBAction func onChooseRSS()
    {
        actionSheetRSSFeedSelection(barButtonItem: self.navigationItem.rightBarButtonItem!) { (url) in
            self.viewModel.reloadData(rssURL: url)
        }
    }
}

//MARK: - UITableView DataSource
extension ThumbnailRSSFeedViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.rssFeedItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailRSSFeedCell.className,
                                                 for: indexPath) as! ThumbnailRSSFeedCell
        cell.fill(with: viewModel.rssFeedItems[indexPath.row])
        
        return cell
    }
}
