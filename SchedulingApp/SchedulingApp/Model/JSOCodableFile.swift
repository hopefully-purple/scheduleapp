//
//  JSOCodableFile.swift
//  SchedulingApp
//https://www.youtube.com/watch?v=_TrPJQWD8qs
//  Created by Hope Welch on 6/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import Foundation

struct JSOCodableFile: Codable {
    
    var status:String = ""
    var totalResults:Int = 0
    var articles:[Article]?
}
