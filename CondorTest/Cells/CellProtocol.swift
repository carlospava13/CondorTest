//
//  CellProtocol.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import Foundation

protocol BaseProtocol : class {}


protocol ArtistCellProtocol: BaseProtocol {
    func didSelected(artist:Artist)
}

