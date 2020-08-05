//
//  ViewController.swift
//  Corona Now
//
//  Created by Miguel Moya on 8/4/20.
//  Copyright © 2020 Miguel Moya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalCasesCard: UIView!
    @IBOutlet weak var recoveredCard: UIView!
    @IBOutlet weak var testedCard: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalCasesCard.layer.cornerRadius = 8
        recoveredCard.layer.cornerRadius = 8
        testedCard.layer.cornerRadius = 8
    }


}

