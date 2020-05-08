//
//  AddPeopleViewController.swift
//  SchedulingApp
//
//  Created by Hope Welch on 4/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

//SO: What Needs To Happen Here (I think)
//1) Get user input on the type of search
//2) IF PROXY
    //a) Show searching animation
    //b) populate a table containing detected accounts of people nearby
    //c) When user is done selecting people, create a new group schedule
        //i) Talk to ______ to do the behind the scenes
        //ii) Talk to whoever it may concern to add to the Groups drop list.
//BUT BE CAREFUL WITH THE DESIGN
    //If already on a group schedule and the user wants to add someone to it, we don't want to create a whole new schedule.
//3) IF MANUAL
    //a) Pull up a search bar for user to enter name or username
    //b) allow multiple people to be selected
    //Create a new group schedule

//4) I WANT TO BE ABLE TO SWIPE THIS VIEW AWAY!!!
//5) I WANT IT TO ANIMATED FROM BOTTOM TO 1/3

class AddPeopleViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var textField1: UITextField!
    
//MARK: - Properties
     var didTapMenuType: ((MenuType) -> Void)?
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        //let recognizer = UITapGestureRecognizer(target: self,
                                                //action: #selector(handleTap(recognizer:)))
        textField1.text = "Choose One"
    }

//    @objc func handleTap(recognizer: UITapGestureRecognizer) {
//        // presentingViewController.dismiss(animated: true)
//         print("ADDPEOPLEHANDLETAP SLIDE")
//         //dismiss(animated: true)
//
//     }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    @IBAction func proximity(_ sender: UIButton) {
        textField1.text = "Searching for nearby friendos . . ."
    }
    
    @IBAction func manual(_ sender: UIButton) {
        textField1.text = "Pulling up data from people pool . . ."
    }
    
    //FUNCTION THAT GRABS DATA FROM PEOPLE POOL
    
    func tempMethod()
    {
        print("MADE IT TO ADD PEOPLE")
    }

    
}
