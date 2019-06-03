//
//  AlbumRoute.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/3/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class AlbumRoute {

    var parentViewController:BaseViewController?
    var storyboard:UIStoryboard?
    init(parentViewController:BaseViewController) {
        self.parentViewController = parentViewController
        self.storyboard = UIStoryboard(name: "Main", bundle: nil)
    }

    func showAlbumDetailViewController(album:Album) {
        let albumDetailVC = self.storyboard?.instantiateViewController(withIdentifier: AlbumDetailViewController.className) as! AlbumDetailViewController
        albumDetailVC.album = album
        self.parentViewController?.navigationController?.pushViewController(albumDetailVC, animated: true)
    }
}
