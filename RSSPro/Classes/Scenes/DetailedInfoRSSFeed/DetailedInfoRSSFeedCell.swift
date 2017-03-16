//
//  DetailedInfoRSSFeedCell.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

class DetailedInfoRSSFeedCell: UITableViewCell
{
    @IBOutlet private var labelTitle: UILabel!
    @IBOutlet private var labelConten: UILabel!
    private let numberOfLineAllowedPerCell = 4
    
    func fill(with item: RSSFeedItem)
    {
        labelTitle.text = item.title

        let numberOfLinesForTitle = labelTitle.lineCount
        let numberOfLinesForContent = numberOfLineAllowedPerCell - numberOfLinesForTitle
        labelConten.numberOfLines = numberOfLinesForContent
        
        labelConten.text = item.content
    }
}
