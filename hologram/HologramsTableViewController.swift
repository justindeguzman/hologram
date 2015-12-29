//
//  HologramsTableViewController.swift
//  hologram
//
//  Created by Justin de Guzman on 28/12/2015.
//  Copyright (c) 2015 Justin de Guzman. All rights reserved.
//

import UIKit

class HologramsTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Hologram {
        var name: String!
        var path: String!
    }
    
    var holograms = [Hologram]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        holograms = [
            Hologram(name: "One", path: "un"),
            Hologram(name: "Two", path: "deux"),
            Hologram(name: "Three", path: "trois")
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("hologramCell") as! UITableViewCell!
        
        if cell == nil {
            cell = UITableViewCell(style:.Default, reuseIdentifier: "hologramCell")
        }

        cell.textLabel!.text = holograms[indexPath.row].name
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holograms.count
    }
}
