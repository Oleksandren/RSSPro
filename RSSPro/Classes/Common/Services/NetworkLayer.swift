//
//  NetworkLayer.swift
//  RSSPro
//
//  Created by Oleksandr Nechet on 15.03.17.
//  Copyright © 2017 Oleksandr Nechet. All rights reserved.
//

import Foundation


let NetworkLayer = _NetworkLayer()

class _NetworkLayer: NetworkManagerProtocol
{
    fileprivate var session: URLSession
    
    init()
    {
        session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func get(url: URL,
             completion:@escaping (_ json: Any?, _ errorMessage: String?) -> Void)
    {
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil, error?.localizedDescription)
            }
            else if data != nil {
                
                let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    completion(json, nil)
                } else {
                    completion(nil, "Server response is invalid")
                }
            }
            else {
                completion(nil, "Server response is a blank")
            }
        }.resume()
    }
}
