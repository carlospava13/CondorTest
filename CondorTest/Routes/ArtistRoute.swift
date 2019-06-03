//
//  ArtistRoute.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class ArtistRoute {

    var parentViewController:BaseViewController?
    var storyboard:UIStoryboard?
    init(parentViewController:BaseViewController) {
        self.parentViewController = parentViewController
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
    }

    func showAlbumViewController(artist:Artist) {
        let albumVC = self.storyboard?.instantiateViewController(withIdentifier: AlbumViewController.className) as! AlbumViewController
        albumVC.artist = artist
        self.parentViewController?.navigationController?.pushViewController(albumVC, animated: true)
    }
}

