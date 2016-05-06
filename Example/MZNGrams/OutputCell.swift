//
//  OutputCell.swift
//  Assignment 2b
//
//  Created by Hamid Ismail on 21/04/2016.
//  Copyright © 2016 Hamid Ismail. All rights reserved.
//

import UIKit
import MZNGrams

class OutputCell: UITableViewCell {

    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var frequencyLabel: UILabel!
    @IBOutlet var gramLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureForDisctinctWord(indexPath: NSIndexPath,outputModel: MZNGramModel) {
        wordLabel.text = outputModel.word
        
        frequencyLabel.text = ""
        gramLabel.text = ""
    }
    
    func configureForNGrams(indexPath: NSIndexPath,outputModel: MZNGramModel) {
        wordLabel.text = outputModel.word
        frequencyLabel.text = String(outputModel.frequency)
        gramLabel.text = String(outputModel.probability)
    }
}
