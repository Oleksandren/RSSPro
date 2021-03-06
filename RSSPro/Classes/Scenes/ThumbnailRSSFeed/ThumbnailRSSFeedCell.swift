//
//  ThumbnailRSSFeedCell.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

class ThumbnailRSSFeedCell: UITableViewCell
{
    @IBOutlet private var imageViewThumbnail: UIImageView!
    @IBOutlet private var labelTitle: UILabel!
    @IBOutlet private var labelDate: UILabel!
    
    func fill(with item: RSSFeedItem)
    {
        labelTitle.text = item.title
        labelDate.text = item.dateString
        imageViewThumbnail.setImage(from: item.imageUrl)
    }
}
