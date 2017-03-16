//
//  NSObject+Utilities.swift
//  TutorTime
//
//  Created by Oleksandr Nechet on 31.10.16.
//  Copyright © 2016 TutorTime. All rights reserved.
//

import Foundation

extension NSObject
{
    static var className: String
    {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
