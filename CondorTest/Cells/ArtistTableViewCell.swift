//
//  ArtistTableViewCell.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit
import SDWebImage
class ArtistTableViewCell: BaseTableViewCell {
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNameLab: UILabel!

    override func setData(data: Any) {
        super.setData(data: data)
        guard let artist = data as? Artist else {
            return
        }

        if let image = artist.images.first?.url {
            self.artistImageView.sd_setImage(with: URL(string: image), completed: nil)
        }

        self.artistNameLab.text = artist.name
    }
}
