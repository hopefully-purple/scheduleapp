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
    static func read()//-> Array<String>
    {
        var array = [String?]()
        
        //A bit of networking
        //Hit the API endpoint (not good idea to have it hardcoded like this
//        let urlString = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-05-08&sortBy=publishedAt&apiKey=API_KEY"
//
//        //Turning urlString into a URL object
//        let url = URL(string: urlString)
//        guard url != nil else { return } //confirm it's not nil
//
//        let session = URLSession.shared
//
//        let dataTask = session.dataTask(with: url!) { (data, response, error) in
//            //Check for errors
//            if error == nil && data != nil {
//                //Parse JSON
//                let decoder = JSONDecoder()
//                do {
//                    let newsFeed = try decoder.decode(JSOCodableFile.self, from: data!)
//                    print(newsFeed)
//                }
//                catch {
//                    print("Error in JSON parsing")
//                }
//
//            }
//        }
//        //Make the API call
//        dataTask.resume()
        
        //____________________
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
                                print("\(value)")
                                // array.append()
                            }
                        }
                    }
                    //  let className = String(describing: presented.self)                   if let friends = json["friends"] as? Array<Dictionary<String, Any>> {
                    //                            for friend in friends {
                    //                                if let handle = friend["handle"] as? String {
                    //                                    print(handle)
                    //                                }
               // }
               // catch { //if json is bad
                 //   print("JSON is bad \(error)")
                //}
            }
        }
        //return array
    }
        
}
