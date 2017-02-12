//
//  Formatter.swift
//  Cubix
//
//  Created by Yuri Aguiar on 10/02/17.
//  Copyright © 2017 Yuri Aguiar. All rights reserved.
//

import UIKit

class Formatter: NSObject {
    
    var scrambler = Scrambler()
    var checker = Checker()
    
    func generate(scrambledSequence: [CubeMoves]) -> String {
        var scrambledSequenceString = ""
        
        for move in scrambledSequence {
            scrambledSequenceString.append(move.rawValue)
            scrambledSequenceString.append(" ")
        }
        
        scrambledSequenceString.remove(at: scrambledSequenceString.index(before: scrambledSequenceString.endIndex))
     
        return scrambledSequenceString
    }

    func separate(scrambledSequence: [CubeMoves]) -> String {
        var separatedSequenceString = ""
        var count = 1
        
        for move in scrambledSequence {
            if (count % 5) == 0 {
                separatedSequenceString.append(move.rawValue)
                separatedSequenceString.append(" - ")
            } else {
                separatedSequenceString.append(move.rawValue)
                separatedSequenceString.append(" ")
            }
            count += 1
        }
        
        for _ in 1...3 {
            separatedSequenceString.remove(at: separatedSequenceString.index(before: separatedSequenceString.endIndex))
        }
        
        return separatedSequenceString
    }
    
    func repeater(sequenceLength: Int, intervalLength: Float, numberOfSequeneces: Int, separateSequenceSwitch: Bool) -> String {
        var scrambledSequence: [CubeMoves] = []
        var scrambledSequenceString = ""
        
        if numberOfSequeneces > 1 && separateSequenceSwitch == false{
            for index in 1...numberOfSequeneces {
                scrambledSequence = scrambler.cubeScrambler(sequenceLength: sequenceLength, intervalLength: intervalLength)
                scrambledSequence = checker.checkSequence(scrambledSequence: scrambledSequence, intervalLength: intervalLength)
                
                scrambledSequenceString.append("\(index).\n")
                scrambledSequenceString.append(generate(scrambledSequence: scrambledSequence))
                scrambledSequenceString.append("\n\n")
                
            }
        } else if numberOfSequeneces == 1 && separateSequenceSwitch == false {
            scrambledSequence = scrambler.cubeScrambler(sequenceLength: sequenceLength, intervalLength: intervalLength)
            scrambledSequence = checker.checkSequence(scrambledSequence: scrambledSequence, intervalLength: intervalLength)
            
            scrambledSequenceString = generate(scrambledSequence: scrambledSequence)
        } else if numberOfSequeneces > 1 && separateSequenceSwitch == true {
            for index in 1...numberOfSequeneces {
                scrambledSequence = scrambler.cubeScrambler(sequenceLength: sequenceLength, intervalLength: intervalLength)
                scrambledSequence = checker.checkSequence(scrambledSequence: scrambledSequence, intervalLength: intervalLength)
                
                scrambledSequenceString.append("\(index).\n")
                scrambledSequenceString.append(separate(scrambledSequence: scrambledSequence))
                scrambledSequenceString.append("\n\n")
            }
        } else if numberOfSequeneces == 1 && separateSequenceSwitch == true {
            scrambledSequence = scrambler.cubeScrambler(sequenceLength: sequenceLength, intervalLength: intervalLength)
            scrambledSequence = checker.checkSequence(scrambledSequence: scrambledSequence, intervalLength: intervalLength)
            
            scrambledSequenceString = separate(scrambledSequence: scrambledSequence)
        }
        
        return scrambledSequenceString
    }
}
