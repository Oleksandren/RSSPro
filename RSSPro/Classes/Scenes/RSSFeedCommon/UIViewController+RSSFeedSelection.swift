//
//  UIViewController+RSSFeedSelection.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

extension UIViewController
{
    func actionSheetRSSFeedSelection(barButtonItem: UIBarButtonItem,
                                     _ completion: @escaping (_ urlRSSFeed: URL) -> Void)
    {
        let alertController = UIAlertController(title: Constants.Strings.rssFeedSelection,
                                                message: Constants.Strings.chooseRSSFeed,
                                                preferredStyle: .actionSheet)
        
        let alertActionCNN = UIAlertAction(title: Constants.Strings.cnn,
                                        style: .default) { (_) in
                                            completion(Constants.RSSFeedURL.cnn)
        }
        alertController.addAction(alertActionCNN)
        
        let alertActionAgriculture = UIAlertAction(title: Constants.Strings.techCrunch,
                                           style: .default) { (_) in
                                            completion(Constants.RSSFeedURL.techCrunch)
        }
        alertController.addAction(alertActionAgriculture)
        
        let alertActionCancel = UIAlertAction(title: Constants.Strings.cancel,
                                              style: .cancel,
                                              handler: nil)
        alertController.addAction(alertActionCancel)
        
            
        alertController.popoverPresentationController?.barButtonItem = barButtonItem
        present(alertController, animated: true, completion: nil)
    }
}
