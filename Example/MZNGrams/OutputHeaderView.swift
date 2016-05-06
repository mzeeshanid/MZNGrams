
//
//  OutputHeaderView.swift
//  Assignment 2b
//
//  Created by Hamid Ismail on 21/04/2016.
//  Copyright © 2016 Hamid Ismail. All rights reserved.
//

import UIKit

class OutputHeaderView: UITableViewHeaderFooterView {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var frequencyLabel: UILabel!
    @IBOutlet var gramLabel: UILabel!

    func configreHeader(section: Int, title: String, isDistinct: Bool) {
        
        titleLabel.text = title
        
        if isDistinct == true {
            frequencyLabel.hidden = true
            gramLabel.hidden = true
        } else {
            frequencyLabel.hidden = false
            gramLabel.hidden = false
        }
    }
    
}
