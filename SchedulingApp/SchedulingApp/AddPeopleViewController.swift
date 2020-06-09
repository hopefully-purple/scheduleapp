//
//  AddPeopleViewController.swift
//  SchedulingApp
//https://www.youtube.com/watch?v=EvwSB80GGDA
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


class AddPeopleViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var textField1: UITextField!
    
//MARK: - Properties
<<<<<<< HEAD
    //var didTapMenuType: ((MenuType) -> Void)?
    //var cells: [DynamicRow] = []
    @IBOutlet var outputPeople: UILabel!
=======
     var didTapMenuType: ((MenuType) -> Void)?
>>>>>>> parent of dd0834b... Just in Case Commit
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        textField1.text = "Choose One"

    }

    @IBAction func dismissButton(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    @IBAction func proximity(_ sender: UIButton) {
        textField1.text = "Searching for nearby friendos . . ."
    }
    
    @IBAction func manual(_ sender: UIButton) {
        textField1.text = "Pulling up data from people pool . . ."
        outputPeople.text = getPeople()
        //call function that pulls up people
    }
    
    //MARK: - TableView Functions
    //function that displays a list of people

//   let mangoCell = BasicCellWrapper(title: "Mango") { [self] text in
//     print(text) // prints Mango
//   }
    
    //MARK: - JSON functions
    
    /**
     Function that calls JSONPeopleReader to get a list of names from the pool
     */
<<<<<<< HEAD
    func getPeople() -> String {
        let names = JSONPeopleReader.read()
        print(names)
        var nameString:String = ""
        for name in names {
            print(name)
            nameString = nameString + "\n" + name
        }
        return nameString
=======
    func getPeople(){
        JSONPeopleReader.read()
//        let names = JSONPeopleReader.read()
//
//        for name in names {
//            print(name)
//        }
        
        
>>>>>>> parent of dd0834b... Just in Case Commit
    }

    
}
