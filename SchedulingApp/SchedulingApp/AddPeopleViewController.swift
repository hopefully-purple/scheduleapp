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
     var didTapMenuType: ((MenuType) -> Void)?
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        textField1.text = "Choose One"
        
        //JSON things
        JSONFile.downloadPeopleList { jsonData in
            guard let jData = jsonData else { return } //grabbing jsonData, putting it in jData, checking if nil
            do
            {
                //trying to parse that data into an actual json object, and casting it into a dictionary
                if let json = try JSONSerialization.jsonObject(with: jData, options: []) as? [String: Any]
                {
                    //Keeping this for later, but not directly applicable for the dictionary rn
//                    if let firstName = json["first_name"] as? String { //casting the key as a string because we know it's a string
//                        print(firstName )
//                    }
                    if let names = json["names"] as? Array<Dictionary<String, String>> {
                        for name in names {
                             print(name)
                            //print(names["title"] ?? "") //This would default to empty if title was nil
                        }
                    }
                    //This is a dictionary that has a key of string paired with string value, and a string key paired with an array value
                    if let friends = json["friends"] as? Array<Dictionary<String, Any>> {
                        for friend in friends {
                            if let handle = friend["handle"] as? String {
                                print(handle)
                            }
                            if let dates = friend["dates_logged_in"] as? Array<String> {
                                for rawDate in dates {
                                    let formatterInput = ISO8601DateFormatter() //formatter for processing the date
                                    if let date = formatterInput.date(from: rawDate){
                                        let formatterOutput = DateFormatter() //formatter for making it pretty
                                        formatterOutput.locale = Locale(identifier: "en_US") //grab the locale of the device dynamically instead!
                                        formatterOutput.dateStyle = .short
                                        print(formatterOutput.string(from: date))
                                    }
                                }
                            }
                        }
                    }
                }
            } catch let err { //if json is bad
                print(err.localizedDescription)
            }
   
        }
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    @IBAction func proximity(_ sender: UIButton) {
        textField1.text = "Searching for nearby friendos . . ."
    }
    
    @IBAction func manual(_ sender: UIButton) {
        textField1.text = "Pulling up data from people pool . . ."
        
        //call function that pulls up people
    }
    
    //function that displays a list of people
    
    //MARK: - Goes in a Model File but Here cuz trying to get stuff to work . . .
    
    
    
    //function that reads the peoplepool data file.
    func getPeople(){
        //how to use json in swift? turn it into an object? like .parse from tankwars
    }

    
}
