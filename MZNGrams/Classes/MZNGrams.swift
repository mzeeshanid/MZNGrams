//
//  MZNGrams.swift
//  Pods
//
//  Created by Muhammad Zeeshan on 06/05/2016.
//
//

import UIKit
import Foundation

public class MZNGrams: NSObject {
    
    public func generateNGramsForString(string: String, n: Int) -> [MZNGramModel] {
        let countedSet = NSCountedSet()
        let range = string.startIndex..<string.startIndex.advancedBy(string.characters.count)
        string.enumerateSubstringsInRange(range, options: .ByWords, { (substring, substringRange, enclosingRange, inout stop: Bool) in
            
            var finalGram = ""
            var counter = 0
            
            let nextStartRange = substringRange.endIndex..<range.endIndex
            string.enumerateSubstringsInRange(nextStartRange, options: .ByWords, { (substring, substringRange, enclosingRange, inout stop: Bool) in
                
                finalGram += finalGram.characters.count > 0 ? ", " : ""
                finalGram = finalGram + substring!
                
                counter += 1
                stop = counter >= n
            })
            
            if counter == n {
                countedSet.addObject(finalGram.lowercaseString)
            } else {
                stop = true
            }
        })
        
        let totalWordCount = string.componentsSeparatedByString(" ").count
        var wordsSet: Set<MZNGramModel> = Set()
        for word in countedSet {
            let frequency = countedSet.countForObject(word)
            let probability = Float(frequency) / Float(totalWordCount)
            let ngramModel = MZNGramModel.init(word: word as! String, frequency: frequency, probability: probability)
            wordsSet.insert(ngramModel)
        }
        
        let ngrams = Array(wordsSet)
        return ngrams
    }
}
