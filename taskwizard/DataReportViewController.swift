//
//  DataReportViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class DataReportViewController: UIViewController {
    
    var dataTaskReports = []
    @IBOutlet weak var tableView: UITableView!
    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension DataReportViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTaskReports.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dataReportCell")!
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSections = 0
        if(dataTaskReports.count > 0) {
            numberOfSections = 1
            tableView.backgroundView = nil
        } else {
            let nilDataLabel = UILabel()
            nilDataLabel.font = UIFont(name: "futura", size: 14.0)
            nilDataLabel.text = "...No Data Tasks Floated..."
            nilDataLabel.textColor = UIColor.darkGrayColor()
            nilDataLabel.textAlignment = .Center
            tableView.backgroundView = nilDataLabel
        }
        return numberOfSections
    }
}