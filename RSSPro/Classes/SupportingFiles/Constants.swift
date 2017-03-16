//
//  Constants.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 15.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import Foundation

struct Constants
{
    struct Error
    {
        static internal let errorTitle = "Error"
    }
    
    struct Strings
    {
        static internal let ok = "OK"
        static internal let cancel = "Cancel"
        static internal let rssFeedSelection = "RSS feed selection"
        static internal let chooseRSSFeed = "Choose rss feed"
        static internal let techCrunch = "TechCrunch"
        static internal let cnn = "CNN"
    }
    
    struct RSSFeedURL
    {
        static internal let cnn = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Frss.cnn.com%2Frss%2Fcnn_topstories.rss")!
        static internal let techCrunch = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Ftechcrunch.com%2Ffeed%2F")!
    }
}
