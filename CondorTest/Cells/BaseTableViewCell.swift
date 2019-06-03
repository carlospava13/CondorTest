//
//  BaseTableViewCell.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, ReusableCell {

    var artistDelegate: ArtistCellProtocol?
    var albumDelegate: AlbumCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(data:Any, delegate: BaseProtocol) {
        if let delegate = delegate as? ArtistCellProtocol{
            self.artistDelegate = delegate
        }

        if let delegate = delegate as? AlbumCellProtocol{
            self.albumDelegate = delegate
        }
    }
}
