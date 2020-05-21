//
//  ProfileSettingViewController.swift
//  SchedulingApp
//
//  Created by Hope Welch on 4/5/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

class ProfileSettingViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var profileName: UITextField!
    
    //MARK: - Properties
    
     let profile = Profile()
    
   //MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.profileName.addTarget(self, action: #selector(onReturn), for: UIControl.Event.editingDidEndOnExit)
         
        //MAJOR TODO: HOW TO GET THE INPUT TO BE 'SAVED' AND STAY THERE ON RE-ENTRY
        if profile.name == ""
        {
            profileName.placeholder = "Name"
        } else {
            profileName.text = profile.name
        }
        
        print("ProfileView: \(profile.name)")
    }
    
     @IBAction func onReturn() {
      //profileName textfield is no longer the first responder
        self.profileName.resignFirstResponder()
       
        //Update model
        let name = String(describing: self.profileName.text)
        profile.setName(string: name)
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
