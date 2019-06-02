//
//  BaseRepository.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

class BaseRepository: NSObject {

    override init() {
        super.init()
        #if MOCK

        #else

        #endif
    }
}
