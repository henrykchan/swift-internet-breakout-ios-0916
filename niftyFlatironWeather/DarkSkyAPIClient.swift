//
//  DarkSkyAPIClient.swift
//  niftyFlatironWeather
//
//  Created by Anthony on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class DarkSkyAPIClient {
    
    class func getRepositories(with completion: @escaping ([String: AnyObject]) -> Void){
        print("getrepos")
        let url = URL(string: "https://api.darksky.net/forecast/\(clientSecret)/\(ReposDataStore.sharedInstance.latitude),\(ReposDataStore.sharedInstance.longitude)")
        print("The latitude that is being passed is \(ReposDataStore.sharedInstance.latitude)")
        
        if let unwrappedURL = url {
            
            let session = URLSession.shared
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                print("session Print \n")
                if let unwrappedData = data {
                    
/* do here */      do {
                     print("data unwrapped")
/* try here */     let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: AnyObject]
    
                        print(responseJSON)
                        // this is going to add each of our dictionaries to the datastore array
    
                        completion(responseJSON)
                        
/* catch here */
                    } catch {
                            
                            // alert api not working
                    }
                }
            }
            task.resume()
        }
    }
}
