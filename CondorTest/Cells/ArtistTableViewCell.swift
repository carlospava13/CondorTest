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
    @IBOutlet weak var followerLab: UILabel!
    @IBOutlet weak var popularityLab: UILabel!
    @IBOutlet weak var popularityProgressView: UIProgressView!

    private var artist:Artist?

    override func setData(data: Any, delegate: BaseProtocol) {
         super.setData(data: data, delegate: delegate)
        guard let artist = data as? Artist else {
            return
        }

        self.artist = artist
        if let image = artist.images.first?.url {
            self.artistImageView.sd_setImage(with: URL(string: image), completed: nil)
        }

        self.artistNameLab.text = artist.name
        self.followerLab.text = "\(Constants.follower) \(artist.followers.total)"
        self.popularityLab.text = "\(Constants.popularity) \(artist.popularity)"
        self.popularityProgressView.progress = Float(artist.popularity / 100)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if let artist = self.artist, selected {
            self.artistDelegate?.didSelected(artist: artist)
        }
    }
}
