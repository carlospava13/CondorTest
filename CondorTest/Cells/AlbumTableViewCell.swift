//
//  AlbumTableViewCell.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit
import SDWebImage
class AlbumTableViewCell: BaseTableViewCell {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLab: UILabel!
    
    
    var album:Album?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let album = self.album, selected {
            self.albumDelegate?.didSelected(album: album)
        }
    }

    override func setData(data: Any, delegate: BaseProtocol) {
        super.setData(data: data, delegate: delegate)
        guard let album = data as? Album else {
            return
        }
        self.album = album

        if let image = album.images.first?.url {
            self.albumImageView.sd_setImage(with: URL(string: image), completed: nil)
        }
        self.albumNameLab.text = album.name
    }
    
}
