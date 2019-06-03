//
//  AlbumDetailViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/3/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit
import SDWebImage
class AlbumDetailViewController: BaseViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLab: UILabel!

    var album:Album?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setData()
    }

    func setData() {
        guard let album = self.album else {
            return
        }

        if let image = album.images.first?.url {
            self.albumImageView.sd_setImage(with: URL(string: image), completed: nil)
        }

        self.albumNameLab.text = album.name
    }
}
