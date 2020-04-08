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

/**
 This is the Main View of the app.
 From here, users can navigate to everything in the app.
 Users will land here after launching and after initial set up.
 
 - Author: Hope Welch
 - Version: 0.1
 
 As of v0.1, this is named View Controller and the second view is named MainViewController. TODO: The naming needs to be fixed
 */
class HomeViewController: UIViewController, UITextFieldDelegate {
    
    let transition = SlideInTransition()
    //optional view switch
    var topView: UIView?
    
    //This is the textfield for the name of the schedule
    //@IBOutlet weak var scheduleNameL: UITextField!
    
    /**
     This is the viewDidLoad function for the Main View
     
     A bit of code sets up the return key functionality
     Set the scheduleNameL placeholder text to the appropriate text
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Bit of code taken from https://stackoverflow.com/questions/11553396/how-to-add-an-action-on-uitextfield-return-key
        //self.scheduleNameL.addTarget(self, action: #selector(onReturn), for: UIControl.Event.editingDidEndOnExit)
        
        //TODO: Get appropriate inforamtion from the model to determine the correct placeholder name
       // scheduleNameL.placeholder = "My Schedule"
        
    }
    
    /**
     This is the action for the filter button
     */
    @IBAction func didFilters(_ sender: UIBarButtonItem) {
        guard let filterViewController = storyboard?.instantiateViewController(withIdentifier:
            "FilterViewController") as? FilterViewController else { return }
        filterViewController.modalPresentationStyle = .popover
        present(filterViewController, animated: true)
    }
    
    /**
     This is the action for the menu button
     */
    @IBAction func didTabMenu(_ sender: UIBarButtonItem) {
        
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier:
            "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
         
    }
    
    func transitionToNew(_ menuType: MenuType) {
        //Change the HomeView title
        var title = String(describing: menuType)
        switch title{
        case "profile":
            break; //We don't want the current schedule to change!
        case "mySchedule":
            title = "My Schedule"
            self.title = title
        case "groupSchedule":
            title = "Group Schedule" //Eventually get specific info
            self.title = title
        case "createNew":
            title = "New Group"
            self.title = title
        case "settings":
            break;
        default:
            break;
        }
       
        //topView?.removeFromSuperview() //part of the change the view color code

        //Action to perform depending on which menuType was tapped
        switch menuType {
        case .profile:
            guard let profileViewController = storyboard?.instantiateViewController(withIdentifier:
                "ProfileSettingViewController") as? ProfileSettingViewController else { return }
            profileViewController.modalPresentationStyle = .popover
            present(profileViewController, animated: true)
        case .createNew:
            guard let addPViewController = storyboard?.instantiateViewController(withIdentifier:
                "AddPeopleViewController") as? AddPeopleViewController else { return }
            addPViewController.modalPresentationStyle = .pageSheet
            present(addPViewController, animated: true)
        case .groupSchedule:
            print("Groups")
            //This might be where we reveal the Add button?
        default:
            break;
//              let view = UIView()
//            view.backgroundColor = .yellow
//            view.frame = self.view.bounds
//            self.view.addSubview(view)
//            self.topView = view
        }
    
    }//the end of transitionToNew in case you are lost
    
    /**
     This function belongs to the text field that displays the name of the current schedule.
     User can tap the field and change the name of the schedule.
     The basic default name is "Me", and if there are other people added, the default is "Me and <name>"
     
     User should be able to either hit return or tap outside of the field to make it save and for the keyboard to disappear.
     
        Need to grab the input and update the Model
     
     TODO: Fix the cursor to be in the middle! (And a few other nitpickies that bug me)
     
     The function declaration and the first line of code is taken from https://stackoverflow.com/questions/11553396/how-to-add-an-action-on-uitextfield-return-key
     */
  // @IBAction func onReturn() {
    //scheduleNameL is no longer the first responder
    //self.scheduleNameL.resignFirstResponder()

    //Update Model!
   //}
    
    
    
//    @IBAction func saveNewCalendarAction(_ sender: UIBarButtonItem) {
//        // Create an Event Store instance
//        let eventStore = EKEventStore();
//
//        // Use Event Store to create a new calendar instance
//        // Configure its title
//        let newCalendar = EKCalendar(for: .event, eventStore: eventStore)
//
//        // Probably want to prevent someone from saving a calendar
//        // if they don't type in a name...
//        newCalendar.title = scheduleNameL.text ?? ""
//
//        // Access list of available sources from the Event Store
//        let sourcesInEventStore = eventStore.sources
//
//        // Filter the available sources and select the "Local" source to assign to the new calendar's
//        // source property
//        newCalendar.source = sourcesInEventStore.filter{
//            (source: EKSource) -> Bool in
//            source.sourceType.rawValue == EKSourceType.local.rawValue
//            }.first!
//
//        // Save the calendar using the Event Store instance
//        do {
//            try eventStore.saveCalendar(newCalendar, commit: true)
//            UserDefaults.standard.set(newCalendar.calendarIdentifier, forKey: "EventTrackerPrimaryCalendar")
//            self.navigationController?.popViewController(animated: true)
//            //self.dismiss(animated: true, completion: nil)
//        } catch {
//            let alert = UIAlertController(title: "Calendar could not save", message: (error as NSError).localizedDescription, preferredStyle: .alert)
//            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(OKAction)
//            self.navigationController?.popViewController(animated: true)
//            //self.present(alert, animated: true, completion: nil)
//        }
//    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
