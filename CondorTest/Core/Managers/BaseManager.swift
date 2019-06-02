//
//  BaseManager.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

class BaseManager: NSObject {
    var isDebug:Bool = false

    override init() {
        super.init()
        #if MOCK
        self.isDebug = false
        #else
        self.isDebug = true
        #endif
    }
}
