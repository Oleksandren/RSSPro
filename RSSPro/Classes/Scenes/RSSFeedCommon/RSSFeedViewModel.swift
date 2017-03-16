//
//  RSSFeedViewModel.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

protocol RSSFeedViewModelProtocol: class
{
    weak var view: RSSFeedViewProtocol? { get set }
    var rssFeedItems: [RSSFeedItem] { get }
    var rssFeedItemsDidChange: (() -> Void)? { get set }
    init(networkManager: NetworkManagerProtocol,
         view: RSSFeedViewProtocol)
    func reloadData(rssURL: URL)
    func reloadData()
}

class RSSFeedViewModel: RSSFeedViewModelProtocol
{
    weak internal var view: RSSFeedViewProtocol?
    private let networkManager: NetworkManagerProtocol
    private let rssUrlString = "https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Frss.cnn.com%2Frss%2Fcnn_topstories.rss"
    var rssFeedItems = [RSSFeedItem]() {
        didSet {
            self.rssFeedItemsDidChange?()
        }
    }
    var rssFeedItemsDidChange: (() -> Void)?
    
    required init(networkManager: NetworkManagerProtocol,
                  view: RSSFeedViewProtocol)
    {
        self.networkManager = networkManager
        self.view = view
    }
    
    func reloadData()
    {
        reloadData(rssURL: Constants.RSSFeedURL.cnn)
    }
    
    func reloadData(rssURL: URL)
    {
        networkManager.get(url: rssURL) { (response, errorMessage) in
            if errorMessage != nil {
                DispatchQueue.main.async {
                    self.view?.display(title: Constants.Error.errorTitle,
                                       message: errorMessage!)
                    self.rssFeedItems = []
                }
            }
            else {
                DispatchQueue.main.async {
                    self.rssFeedItems = self.parse(response: response)
                }
            }
        }
    }
}

extension RSSFeedViewModel
{
    fileprivate func parse(response: Any?) -> [RSSFeedItem]
    {
        guard let dictionaryResponse = response as? [String: Any],
            let arrayItems = dictionaryResponse["items"] as? [[String: Any]] else
        {
            return []
        }
        
        let result = arrayItems.flatMap { (dictionaryItem) -> RSSFeedItem? in
            guard
                let title = dictionaryItem["title"] as? String,
                let pubDate = dictionaryItem["pubDate"] as? String,
                let content = dictionaryItem["content"] as? String,
                let enclosureDictionary = dictionaryItem["enclosure"] as? [String: Any],
                let imageUrlString = enclosureDictionary["link"] as? String,
                let imageUrl = URL(string: imageUrlString) else
            {
                return nil
            }
            
            guard
                !title.isEmpty &&
                !pubDate.isEmpty &&
                !content.isEmpty else
            {
                return nil
            }
            
            return RSSFeedItem(title: title,
                               dateString: pubDate,
                               content: content,
                               imageUrl: imageUrl)
        }
        
        return result
    }
}
