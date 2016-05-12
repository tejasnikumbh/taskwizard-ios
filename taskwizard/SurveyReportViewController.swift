//
//  SurveyReportViewController.swift
//  taskwizard
//
//  Created by Tejas Nikumbh on 5/12/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit

class SurveyReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension SurveyReportViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("surveyReportCell")!
        return cell
    }
}