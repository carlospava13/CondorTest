//
//  ViewController.swift
//  CondorTest
//
//  Created by Carlos Pava on 6/2/19.
//  Copyright © 2019 Carlos Pava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        #if MOCK
        print("MOCK")
        #else
        print("Debug")
        #endif
    }


}

