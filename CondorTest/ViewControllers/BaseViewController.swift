//
//  BaseViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(title:String,subTitle:String){
        let alert = UIAlertController(title: title, message: title, preferredStyle: .alert)
        let done = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(done)
        self.present(alert, animated: true, completion: nil)
    }
}
