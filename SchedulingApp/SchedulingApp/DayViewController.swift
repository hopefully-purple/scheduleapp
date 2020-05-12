//
//  DayViewController.swift
//  SchedulingApp
//
//  Created by Hope Welch on 5/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var label1: UILabel!
    
    //MARK: - Properties
    let home = HomeViewController()
    var date:String = ""
    
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = date
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
