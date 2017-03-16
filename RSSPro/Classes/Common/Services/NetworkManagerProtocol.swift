//
//  NetworkManagerProtocol.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 15.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol
{
    func get(url: URL,
             completion:@escaping (_ json: Any?, _ errorMessage: String?) -> Void)
}
