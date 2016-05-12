//
//  DataReportViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class DataReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension DataReportViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("dataReportCell")!
        return cell
    }
}