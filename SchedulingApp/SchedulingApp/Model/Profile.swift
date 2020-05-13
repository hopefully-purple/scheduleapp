//
//  Profile.swift
//  SchedulingApp
//
//  Created by Hope Welch on 4/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import Foundation

/**
 This Model class creates a profile object
 
 Goals:
 - Recieve information externally
 - Make information JSON-able
 - Give information requested externally
 
 - Author: Hope Welch
 - Version: 0.1
 */
class Profile
{
    var name:String = ""

    //Eventually, we'll probably have a friend count, schedule count, scheduleID, etc
    
    /**
     Initializer
     */
    init()
    {
        self.name = ""
    }
    
    func setName(string: String)
    {
        self.name = string
        print(name)
    }
    
    
}
////
//class Attendee: CustomStringConvertible, Decodable {
//  //
//  // MARK: - Variables And Properties
//  //
//  var age: UInt8
//  var badgeNumber: UInt8
//  var isFirstTimeAttending: Bool
//  var name: String
//  var nationality: String
//
//  var description: String {
//    return """
//    Name: \(name)
//    Nationality: \(nationality)
//    Age: \(age)
//    Badge Number: \(badgeNumber)
//    Attending For The First Time: \(isFirstTimeAttending ? "Yes" : "No")
//    """
//  }
//
//  //
//  // MARK: - Initialization
//  //
//  init(age: UInt8, badgeNumber: UInt8, isFirstTimeAttending: Bool, name: String, nationality: String) {
//    self.age = age
//    self.badgeNumber = badgeNumber
//    self.isFirstTimeAttending = isFirstTimeAttending
//    self.name = name
//    self.nationality = nationality
//  }
//}
