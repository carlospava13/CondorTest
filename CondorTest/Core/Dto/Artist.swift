//
//  Artist.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

struct Artist: Decodable {
    var popularity: Int
    var name:String
    var images:[ImageArtist]
}
