//
//  ViewController.swift
//  SchedulingApp
//
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
        let title = String(describing: menuType).capitalized
        self.title = title
        
        //OK. The next bit of code I want to save for the Group option. It might be what I want to use
        //when I don't want to change the controller, and just change the data/info inside it.
        //So I'm going to comment the whole thing out for now until I figure a way to make it unique to the group section
        
        //ep 3 minute 9, he talks about some tidbits that he doesn't code
        //Here is where I might figure out how to simply switch screens
        //All sections of code involving this will be labelled like:
        //optional view switch
        topView?.removeFromSuperview()
        //topView?.removeFromParent()
        switch menuType {
        case .profile:
            print("helloooooo")
            print(storyboard as Any)
            guard let profileViewController = storyboard?.instantiateViewController(withIdentifier:
                "ProfileSettingViewController") as? ProfileSettingViewController else { return }
            //profileViewController.didTapMenuType = { profileType in
              //  self.transitionToNew(profileType)
            //}
            print("Inside the profile case")
            profileViewController.modalPresentationStyle = .popover
            //profileViewController.transitioningDelegate = self
            present(profileViewController, animated: true)
            //self.performSegue(withIdentifier: "profileSettingSegue", sender: self)
        case .createNew:
            print("inside crate new switch")
        default:
            break;
//              let view = UIView()
//            view.backgroundColor = .yellow
//            view.frame = self.view.bounds
//            self.view.addSubview(view)
//            self.topView = view
        }
    }
    
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
