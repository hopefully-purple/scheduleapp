//
//  JSONFile.swift
//  SchedulingApp
//https://www.youtube.com/watch?v=EvwSB80GGDA
//  Created by Hope Welch on 6/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import Foundation

//Should be a dictionary where the only key is names and it's value is an array of names
let peopleList = """
{
    "names": [{"name1": "Bob"}, {"name2": "Billy"}, {"name3": "Joe"}, {"name4": "Frank"}],
    
    "friends": [
        {
            "handle": "BuggyBoy",
            "dates_logged_in": [
                "2020-06-08T21:12:25+0000",
                "2020-06-07T21:12:25+0000"
            ]
        }
    ]

}
"""


class JSONFile {
    //Simulating a real network request, where we put the string above into the data object, just like you might get from a url session in swift.
    static func downloadPeopleList(completion:((_ json: Data?) throws -> Void)){
        do {
            try completion(Data(peopleList.utf8))
        } catch {
            print("Help")
        }
    }
}

