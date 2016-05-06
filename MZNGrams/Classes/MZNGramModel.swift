//
//  MZNGramModel.swift
//  Pods
//
//  Created by Hamid Ismail on 06/05/2016.
//
//

import UIKit

public class MZNGramModel: NSObject {
    
    public var word: String = ""
    public var frequency: Int = 0
    public var probability: Float = 0.0
    
    public convenience init(word: String, frequency: Int, probability: Float) {
        self.init()
        
        self.word = word
        self.frequency = frequency
        self.probability = probability
    }
}
