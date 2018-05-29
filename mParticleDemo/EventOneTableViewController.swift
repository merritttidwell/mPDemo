//
//  EventOneTableViewController.swift
//  mParticleDemo
//
//  Created by Merritt Tidwell on 5/22/18.
//  Copyright © 2018 Merritt Tidwell. All rights reserved.
//

import UIKit
import mParticle_Apple_SDK

class EventOneTableViewController: UITableViewController {

    var nearbyStores = ["Union & Laguna","Polk Street", "Hyde & Beach", "Jones & Jefferson", "Bay & Taylor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nearbyStores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = nearbyStores[indexPath.row]
        cell.detailTextLabel?.text = "Open"
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let title = nearbyStores[indexPath.row]
        
        let eventName = "\(title) Link - Tap"
        
        let event = MPEvent.init(name: eventName, type: .other)
        event?.category = "Nearby Stores"
        
        event?.info = ["Hours of Operation" : "6:00 AM - 10:00PM",
                       "Distance from Current Location" : "0.7mi"]
        
        
        MParticle.sharedInstance().logEvent(event!)
        
        
    }
}
