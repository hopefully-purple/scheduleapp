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


