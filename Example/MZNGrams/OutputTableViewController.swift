//
//  OutputTableViewController.swift
//  Assignment 2b
//
//  Created by Hamid Ismail on 21/04/2016.
//  Copyright © 2016 Hamid Ismail. All rights reserved.
//

import UIKit
import MZNGrams

class OutputTableViewController: UITableViewController {

    var objectiveType: String!
    var fileName: String!
    
    var viewLoaded: Bool = false
    
    var output: [MZNGramModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "OutputHeaderView", bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "OutputHeaderView")
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if viewLoaded == false {
            
            let ngram = MZNGrams.init()
            
            viewLoaded = true

            do {
                let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")
                let fileString = try String(contentsOfFile: filePath!)
                
                if objectiveType == distictWords {
                    output = ngram.generateNGramsForString(fileString, n: 1)
                } else if objectiveType == unigramForMostOccuring {
                    output = ngram.generateNGramsForString(fileString, n: 1)
                    output = output.sort({ (model1, model2) -> Bool in
                        return model1.frequency > model2.frequency
                    })
                } else if objectiveType == unigramForLeastOccuring {
                    output = ngram.generateNGramsForString(fileString, n: 1)
                    output = output.sort({ (model1, model2) -> Bool in
                        return model1.frequency < model2.frequency
                    })
                } else if objectiveType == bigramForMostOccuring {
                    output = ngram.generateNGramsForString(fileString, n: 2)
                    output = output.sort({ (model1, model2) -> Bool in
                        return model1.frequency > model2.frequency
                    })
                } else if objectiveType == trigramForLeastOccuring {
                    output = ngram.generateNGramsForString(fileString, n: 3)
                    output = output.sort({ (model1, model2) -> Bool in
                        return model1.frequency < model2.frequency
                    })
                }
                
                tableView.reloadData()
                
            } catch {
                debugPrint("Error while reading file: \(error)")
            }
        }
    }
}

//MARK: UITableViewDatasource

extension OutputTableViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: OutputCell = self.tableView.dequeueReusableCellWithIdentifier("OutputCell", forIndexPath: indexPath) as! OutputCell
        let outputModel = output[indexPath.row]
        
        if objectiveType == distictWords {
            cell.configureForDisctinctWord(indexPath, outputModel: outputModel)
        } else {
            cell.configureForNGrams(indexPath, outputModel: outputModel)
        }
        
        return cell
    }
}

//MARK: UITableViewDelegates 

extension OutputTableViewController {
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let identifier = "OutputHeaderView"
        let headerView: OutputHeaderView = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier(identifier) as! OutputHeaderView
        headerView.configreHeader(section, title: objectiveType, isDistinct: objectiveType == distictWords)
        return headerView
    }
    
}
