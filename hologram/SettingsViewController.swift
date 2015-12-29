//
//  SettingsViewController.swift
//  hologram
//
//  Created by Justin de Guzman on 28/12/2015.
//  Copyright (c) 2015 Justin de Guzman. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    struct Setting {
        var sectionName: String!
        var sectionObjects: [String]!
    }

    var settings = [Setting]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings = [
            Setting(sectionName: "General", sectionObjects:
                ["About Us", "Restore Purchases"]),
            Setting(sectionName: "Feedback", sectionObjects:
                ["Contact Us", "Rate Our App", "Follow us on Twitter"])
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settings[section].sectionName
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("settingsCell") as! UITableViewCell!
        
        if cell == nil {
            cell = UITableViewCell(style:.Default, reuseIdentifier: "settingsCell")
        }

        cell.textLabel!.text = settings[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return settings.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].sectionObjects.count
    }
}
