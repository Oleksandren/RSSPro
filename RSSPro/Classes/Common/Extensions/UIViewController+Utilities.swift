//
//  UIViewController+Utilities.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 16.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import UIKit

extension UIViewController
{
    func display(title: String, message: String)
    {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let alertActionOK = UIAlertAction(title: Constants.Strings.ok,
                                          style: .default,
                                          handler: nil)
        alertController.addAction(alertActionOK)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
