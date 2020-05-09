//
//  ViewController.swift
//  SchedulingApp
//
// https://www.raywenderlich.com/1000705-model-view-controller-mvc-in-ios-a-modern-approach
// ^^ This is about how to use MVC with iOS development!!
//  Created by Ethan Christensen on 3/25/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit
import EventKit
import FSCalendar

/**
 This is the Main View of the app.
 From here, users can navigate to everything in the app.
 Users will land here after launching and after initial set up.
 
 - Author: Hope Welch
 - Version: 0.5
 
 Many capabilities have been implemented, including transition animation of 3 types, tap gesture dismissal, calendar view
 */
class HomeViewController: UIViewController, UITextFieldDelegate, FSCalendarDelegate, UIGestureRecognizerDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var scheduleDetailField: UITextField!
    @IBOutlet weak var addFriendsButton: UIButton!
    //MARK: - Properties
    
    //The following are transition delegates that determine the type of animation a view will have
    let transitionR = SlideInTransitionRight()
    let transitionU = SlideInTransitionUp()
    let transitionL = SlideInTransitionLeft()
    
    //This is the textfield for the name of the schedule
    //@IBOutlet weak var scheduleNameL: UITextField!
    
    
    //MARK: - Functions
    /**
     This is the viewDidLoad function for the Main View
     
     A bit of code sets up the return key functionality
     Set the scheduleNameL placeholder text to the appropriate text
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        addFriendsButton.isHidden = true
        //TODO: Get appropriate inforamtion from the model to determine the correct placeholder name
       // scheduleNameL.placeholder = "My Schedule"
        
    }
    
    /**
     Calendar actions
     */
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let selectedDate = formatter.string(from: date)
        scheduleDetailField.text = selectedDate
    }
    
    @IBAction func newEvent(_ sender: UIButton) {
        print("Add a new Event!!")
    }
    /**
     This is the action for the filter button
        It indicates that the FilterViewController should be presented on top of the current view
     */
    @IBAction func didFilters(_ sender: UIBarButtonItem) {

         guard let filterViewController = storyboard?.instantiateViewController(withIdentifier:
             "FilterViewController") as? FilterViewController else { return }

         filterViewController.modalPresentationStyle = .overCurrentContext
         filterViewController.transitioningDelegate = self
         present(filterViewController, animated: true)
    }
    
    /**
     This is the button for adding friends
        It indicates that the AddPeopleVIewController should be presented on top of the current view
     */
    @IBAction func addFriends(_ sender: UIButton) {

         guard let addPeopleViewController = storyboard?.instantiateViewController(withIdentifier:
             "AddPeopleViewController") as? AddPeopleViewController else { return }

         addPeopleViewController.modalPresentationStyle = .overCurrentContext
         addPeopleViewController.transitioningDelegate = self
         present(addPeopleViewController, animated: true)
    }
    
    /**
     This is the action for the menu button, calls the MenuViewController forward, calls transitionToNew
     */
    @IBAction func didTabMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier:
            "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNewR(menuType)
        }
       
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)

    }
    
    //MARK: - Animation
    /**
     I don't think this method is necessary?? Keeping just in case I need this for populating a view?
     */
    func transitionToNewU()
    {
        print("newU")
        
    }
    
    /**
     This function 1) changes the title of the selected view 2) Determines which view to present
     */
    func transitionToNewR(_ menuType: MenuType) {
        
        //Change the HomeView title MAJOR Q:: DOES THIS BELONG HERE WITH MVC??
        var title = String(describing: menuType)
        //print("Inside transition to new. switch title label")
        switch title{
        case "profile":
            break; //We don't want the current schedule to change!
        case "mySchedule":
            title = "My Schedule"
            self.title = title
            addFriendsButton.isHidden = true
        case "groupSchedule":
            title = "Group Schedule" //Eventually get specific info
            self.title = title
            addFriendsButton.isHidden = false
        case "createNew":
            title = "New Group"
            self.title = title
            addFriendsButton.isHidden = false
        case "settings":
            break;
        default:
            break;
        }

        //Action to perform depending on which menuType was tapped
        switch menuType {
        case .profile:
            guard let profileViewController = storyboard?.instantiateViewController(withIdentifier:
                "ProfileSettingViewController") as? ProfileSettingViewController else { return }
            profileViewController.modalPresentationStyle = .popover
            present(profileViewController, animated: true)
        case .createNew:
            guard let addPeopleViewController = storyboard?.instantiateViewController(withIdentifier:
                "AddPeopleViewController") as? AddPeopleViewController else { return }

            addPeopleViewController.modalPresentationStyle = .overCurrentContext
            addPeopleViewController.transitioningDelegate = self
            present(addPeopleViewController, animated: true)
        case .groupSchedule:
            print("groups")
            //This might be where we reveal the Add button?
        default:
           //print("DEFAULT IN HOME")
            break;
        }
    
    }//the end of transitionToNew in case you are lost
 

}//end of class
//MARK: - Transition Right
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let className = String(describing: presented.self)
        
        if className.contains("MenuViewController")
        {
            transitionR.isPresenting = true
            return transitionR
            
        } else if className.contains("AddPeopleViewController")
        {
            transitionU.isPresenting = true
            return transitionU
            
        } else if className.contains("FilterViewController")
        {
            transitionL.isPresenting = true
        }
        
        return transitionL
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let className = String(describing: dismissed.self)
        
        if className.contains("MenuViewController")
        {
            transitionR.isPresenting = false
            return transitionR
            
        } else if className.contains("AddPeopleViewController")
        {
            transitionU.isPresenting = false
            return transitionU
            
        } else if className.contains("FilterViewController")
        {
            transitionL.isPresenting = false
        }
            
        return transitionL
    }
}

