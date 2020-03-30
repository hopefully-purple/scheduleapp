//
//  ViewController.swift
//  SchedulingApp
//
//  Created by Ethan Christensen on 3/25/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

/**
 This is the Main View of the app.
 From here, users can navigate to everything in the app.
 Users will land here after launching and after initial set up.
 
 - Author: Hope Welch
 - Version: 0.1
 
 As of v0.1, this is named View Controller and the second view is named MainViewController. TODO: The naming needs to be fixed
 */
class ViewController: UIViewController, UITextFieldDelegate {
    
    var name: String = ""
    
    @IBOutlet weak var scheduleNameL: UITextField!
    
    @IBOutlet weak var testLabel: UILabel!
    
    /**
     This is the viewDidLoad function for the Main View
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bit of code taken from https://stackoverflow.com/questions/11553396/how-to-add-an-action-on-uitextfield-return-key
        self.scheduleNameL.addTarget(self, action: #selector(onReturn), for: UIControl.Event.editingDidEndOnExit)
        
    }
    
    /**
     This function belongs to the text field that displays the name of the current schedule.
     User can tap the field and change the name of the schedule.
     The basic default name is "Me", and if there are other people added, the default is "Me and <name>"
     
     User should be able to either hit return or tap outside of the field to make it save and for the keyboard to disappear.
     
        Need to grab the input and update the Model
        Need to display corresponding default text at first
     
     TODO: Determine if text field is the right object.
     
     The function declaration and the first line of code is taken from https://stackoverflow.com/questions/11553396/how-to-add-an-action-on-uitextfield-return-key
     */
   @IBAction func onReturn() {
    //scheduleNameL is no longer the first responder
    self.scheduleNameL.resignFirstResponder()

    //Change the label name to the input. TODO: Delete this temp feature
    name = scheduleNameL.text!
    testLabel.text = name
   }
    
    
}

