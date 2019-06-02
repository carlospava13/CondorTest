//
//  Item.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

struct Item: Decodable {
    var items:[Artist]
    var href:String
}
