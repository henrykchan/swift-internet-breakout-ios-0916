//
//  ViewController.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/27/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation


class ViewController: UIViewController {

    var store = ReposDataStore.sharedInstance
    
    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
   
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBAction func fiveDayButton(_ sender: AnyObject) {
    
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        print("hi")
        ReposDataStore.sharedInstance.latitude = self.latitude
        ReposDataStore.sharedInstance.longitude = self.longitude
        
        self.store.getRepositoriesFromAPI {
            
            DispatchQueue.main.async {
               
                self.temperatureLabel.text = ("\(ReposDataStore.sharedInstance.temperature)˚F")
                self.summaryLabel.text = ReposDataStore.sharedInstance.summary
            }


        }
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        print("finish numberSections")
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("repo count in tableView call for row count \(store.repositories.count)")
//        return store.repositories.count
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("cells in")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
//        
//        let nameView = store.repositories[indexPath.row].fullName
//        let urlView = store.repositories[indexPath.row].htmlURL
//        //        let idView = store.repositories[indexPath.row].repositoryID
//        
//        cell.detailTextLabel?.text = String(describing: urlView)
//        cell.textLabel?.text = ("\(nameView)")
//        // cell.detailLabel?.text = urlView
//        //        self.idLabel.text = String(describing: idView)
//        print("cells out")
//        return cell
//    }
//    
}



extension ViewController: CLLocationManagerDelegate{
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if let unwrappedlatitude = locationManager.location?.coordinate.latitude, let unwrappedLongitude = locationManager.location?.coordinate.longitude{
            self.latitude = unwrappedlatitude
            self.longitude = unwrappedLongitude
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}

