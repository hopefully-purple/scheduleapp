//
//  MainViewController.swift
//  SchedulingApp
//
//  Created by Hope Welch on 3/25/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

//import Foundation
import UIKit

/**
 Need to change the name! This is no longer the Main View
 */
class MainViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func navButton(_ sender: Any) {
       // splitViewController(MainViewController, ViewController)
    }

    func splitViewController(_ splitViewController: UISplitViewController,
    separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController?
    {
        return  nil
    }
    
    
}
