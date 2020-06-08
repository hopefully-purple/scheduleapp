//
//  JSONPeopleReader.swift
//  SchedulingApp
//https://www.youtube.com/watch?v=EvwSB80GGDA < simple without using Codable
//https://www.youtube.com/watch?v=_TrPJQWD8qs < Coding with Chris
//
//https://developer.apple.com/swift/blog/?id=37 < This is gonna be helpful whe nwe get a database of some sort I think. When we want to get dynamic functionality
//  Created by Hope Welch on 6/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import Foundation

class JSONPeopleReader
{
    //MARK: - Properties
    
    //MARK: - Functions
    
    //This function reads
    static func read() -> Array<String>
    {
        var array = [String]()
        
        JSONFile.downloadPeopleList { jsonData in
            guard let jData = jsonData else { return } //grabbing jsonData, putting it in jData, checking if nil
            //do
            //{
                //trying to parse that data into an actual json object, and casting it into a dictionary
                if let json = try JSONSerialization.jsonObject(with: jData, options: []) as? [String: Any]
                {
                    if let names = json["names"] as? Array<Dictionary<String, String>>
                    {
                        for name in names
                        {
                            for (key, value) in name {
                                array.append(value)
                            }
                        }
                    }
               // }
               // catch { //if json is bad
                 //   print("JSON is bad \(error)")
                //}
            }
        }
        return array
    }
        
}
