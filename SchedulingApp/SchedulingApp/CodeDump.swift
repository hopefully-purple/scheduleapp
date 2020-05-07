//
//  CodeDump.swift
//  SchedulingApp
//
//  This is a file for code that needs to be cut from working files, but shouldn't be deleted out of existence.
//
//  Created by Hope Welch on 5/6/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import Foundation

//MARK: - Old MenuViewController code

////import Foundation
//import UIKit
//
//enum MenuType: Int {
//    case profile
//    case mySchedule
//    case groupSchedule
//    case createNew
//    case settings
//}
//
///**
//The menu
// */
//class MenuViewController: UITableViewController, UIGestureRecognizerDelegate {
//
//
//    //MARK: - Properties
//
//
//    var didTapMenuType: ((MenuType) -> Void)?
//
//    //MARK: - Functions
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        guard let menuType = MenuType(rawValue:  indexPath.row) else { return }
//
//        dismiss(animated: true) { [weak self] in
//            print("Dismissing: \(menuType)")
//            switch menuType{
//                case .profile:
//                self?.didTapMenuType?(menuType)
//            case .groupSchedule:
//                self?.didTapMenuType?(menuType)
//            case .mySchedule:
//                self?.didTapMenuType?(menuType)
//            case .createNew:
//                self?.didTapMenuType?(menuType)
//                //Here might be where I want to create a new schedule under groups. Tricky part is, internet is saying that has to do with Model
//            default:
//                break;
//            }
//
//        }
//    }
//
//}



//MARK: - Code snippets from UIPresenationController Tutorial

//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//  if let controller = segue.destination as? GamesTableViewController {
//    if segue.identifier == "SummerSegue" {
//      controller.gamesArray = dataStore.allGames.summer
//
//      //1
//      slideInTransitioningDelegate.direction = .left
//    } else if segue.identifier == "WinterSegue" {
//      controller.gamesArray = dataStore.allGames.winter
//
//      //2
//      slideInTransitioningDelegate.direction = .right
//    }
//    controller.delegate = self
//
//    //3
//    controller.transitioningDelegate = slideInTransitioningDelegate
//
//    //4
//    controller.modalPresentationStyle = .custom
//  } else if let controller = segue.destination as? MedalCountViewController {
//    controller.medalWinners = presentedGames?.medalWinners
//
//    //5
//    slideInTransitioningDelegate.direction = .bottom
//    controller.transitioningDelegate = slideInTransitioningDelegate
//    controller.modalPresentationStyle = .custom
//  }
//}

//MARK: - Old code from Home View

//extension HomeViewController: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.isPresenting = true
//        print("transition = true")
//        return transition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.isPresenting = false
//        print("transition = false")
//        return transition
//    }
//}

//MARK: - Random Code snippets



//Bit of code taken from https://stackoverflow.com/questions/11553396/how-to-add-an-action-on-uitextfield-return-key
//self.scheduleNameL.addTarget(self, action: #selector(onReturn), for: UIControl.Event.editingDidEndOnExit)
/////////////////////
//    let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(_:)))
//            tap.delegate = self
//            self.view.addGestureRecognizer(tap)
//
//
//
//    func handleTap(sender: UITapGestureRecognizer? = nil)
//        {
//            hideView()
//        }
////////////////////////////////
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


