//
//  ViewController.swift
//  JSON TableView
//
//  Created by John Clem on 3/4/15.
//  Copyright (c) 2015 Learn Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var repositories = [Repository]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = repositories[indexPath.row].name
        cell.detailTextLabel?.text = repositories[indexPath.row].description
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let reposURL = NSURL(string: "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars&order=desc")
        // 2
        if let JSONData = NSData(contentsOfURL: reposURL!) {
            // 3
            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary {
                // 4
                if let reposArray = json["items"] as? [NSDictionary] {
                    // 5
                    for item in reposArray {
                        repositories.append(Repository(json: item))
                    }
                }
            }
        }
    }
}