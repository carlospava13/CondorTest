//
//  NSObject+String.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }

    class var className: String {
        return String(describing: self)
    }

    class var nibName: String {
        if let name = String(describing: self).components(separatedBy: ".").last {
            return name
        }
        return String(describing: self)
    }
}
