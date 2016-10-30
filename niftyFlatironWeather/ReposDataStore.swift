//
//  ReposDataStore.swift
//  niftyFlatironWeather
//
//  Created by Anthony on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit


class ReposDataStore {
    var repositories = [DarkSkyWeather]()
    var summary: String = ""
    var temperature: String = ""
    var timeArray: [String] = []
    var temperatureArray: [String] = []
    var summaryArray: [String] = []
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    static let sharedInstance = ReposDataStore()
    private init(){}
    
    func getRepositoriesFromAPI(completion: @escaping () -> Void ) {
        
        self.repositories = []
        
        print("repo started")
        
        // responseJSON below is coming from the completion closure in DarkSkyAPIClient.swift
        DarkSkyAPIClient.getRepositories { (responseJSON) in
            
            if let currently = responseJSON["currently"] as? [String: AnyObject] {
                 self.summary = currently["summary"] as! String
                self.temperature = String(currently["temperature"] as! Int)
                
                completion()
                
             //   self.repositories.append()
                
                print("Summary is \(self.summary)")
                print("temperature is \(self.temperature)˚ Degrees")
                
            }
            
            if let daily = responseJSON["daily"] as? [String: AnyObject] {
                print("time worked")
                if let data = daily["data"] as? [[String: AnyObject]] {
                    print("time worked")
                    for (index, day) in data.enumerated() {
                        print("time worked")
                        if index < 5 {
                            let time = day["time"] as! Int
                            print("time worked")
                            let dayTemp = day["temperatureMax"] as! Int
                            print("worked temp")
                            let daySummary = day["summary"] as! String
                            print("worked summary")
                            self.summaryArray.append(daySummary)
                            self.temperatureArray.append(String(dayTemp))
                            self.timeArray.append(String(time))
                        }
                }
            }
                            
        }
        
    }
}
}

//
//                print("repo made")
//
//
//            
//        }
//        
//        
//    }
//
