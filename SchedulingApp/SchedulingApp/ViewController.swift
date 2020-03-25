//
//  ViewController.swift
//  SchedulingApp
//
//  Created by Ethan Christensen on 3/25/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var labelText: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        labelText.text = "party hardy"
    }
}

