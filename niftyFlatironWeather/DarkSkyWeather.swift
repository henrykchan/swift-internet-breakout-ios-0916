//
//  DarkSkyWeather.swift
//  niftyFlatironWeather
//
//  Created by Anthony on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class DarkSkyWeather {
    
//    var currently: [String: Any]
//    var hourly: [String: Any]
//    var daily: [String: Any]
    
    
    var summary: String
    var temperature: Int
    
    init(summary: String, temperature: Int) {
        
        self.summary = summary
        self.temperature = temperature
        
//        print(dictionary["currently"])
//        self.currently = dictionary["currently"] as! [String: Any]
//       
//        print(dictionary["hourly"])
//        self.hourly = dictionary["hourly"] as! [String: Any]
//       
//
//        print(dictionary["daily"])
//        self.daily = dictionary["daily"] as! [String: Any]
        
//        convenience init (summary: String, temperature: Int) {
//            
//            self.summary = summary
//            self.temperature = temperature
//        }
        
        
        
        
        // grab from the json dictionary the info needed like fullName, ID all that stuff
    }
    
    
}
