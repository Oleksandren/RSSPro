//
//  ThumbnailRSSFeedItem.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import Foundation

class RSSFeedItem
{
    let title: String
    let dateString: String
    let content: String
    let imageUrl: URL
    
    init(title: String,
         dateString: String,
         content: String,
         imageUrl: URL)
    {
        self.title = title
        self.dateString = dateString
        self.content = content
        self.imageUrl = imageUrl
    }
}
