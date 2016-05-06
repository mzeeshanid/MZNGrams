//
//  ObjectivesTableViewController.swift
//  Assignment 2b
//
//  Created by Hamid Ismail on 21/04/2016.
//  Copyright © 2016 Hamid Ismail. All rights reserved.
//

import UIKit

let distictWords = "Distinct words"
let unigramForMostOccuring = "Most occuring words and their 1-gram"
let unigramForLeastOccuring = "Least occuring words and their 1-gram"
let bigramForMostOccuring = "Most occuring word pairs and their bigram"
let trigramForLeastOccuring = "Least occuring word pairs and their trigram"

class ObjectivesTableViewController: UITableViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    
    let objectives: [String] = [distictWords, unigramForMostOccuring, unigramForLeastOccuring, bigramForMostOccuring, trigramForLeastOccuring]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ObjectivesTableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectives.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ObjectCell", forIndexPath: indexPath)
        cell.textLabel?.text = objectives[indexPath.row]
        return cell
    }
    
}

extension ObjectivesTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let fileName = segmentedControl.selectedSegmentIndex == 0 ? "WSJ0.Random.1000Sent" : "WSJ0.Random.10000Sent"
        
        let outputController = self.storyboard?.instantiateViewControllerWithIdentifier("OutputTableViewController") as! OutputTableViewController
        outputController.fileName = fileName
        outputController.objectiveType = objectives[indexPath.row]
        self.navigationController?.pushViewController(outputController, animated: true)
    }
}
