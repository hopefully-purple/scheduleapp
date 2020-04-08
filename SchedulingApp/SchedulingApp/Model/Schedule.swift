//
//  Schedule.swift
//  SchedulingApp
//
//  Created by Hope Welch on 4/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import Foundation

/**
 This is the Schedule class in the Model. This creates a schedule object.
 
 Meant to be generic to have multiple schedule objects
 
 Goals:
 - Recieve data
 - Make information JSON-able
 - Allow external to access certain information
 
 - Author: Hope
 - Version: 0.1
 */
class Schedule
{
    var schedName: String
    
    init(name: String){
        self.schedName = name
    }
    
    func getName() -> String {
        return schedName
    }
    
}
