//
//  ViewController.swift
//  POC
//
//  Created by RNTBCI45 on 01/12/17.
//  Copyright © 2017 RNTBCI45. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let network = Network()
        network.getPlaces("Chennai")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

