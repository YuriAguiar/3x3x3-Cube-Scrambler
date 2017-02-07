//
//  FirstViewController.swift
//  Cubix
//
//  Created by Yuri Aguiar on 29/01/17.
//  Copyright © 2017 Yuri Aguiar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let intervalLength : Float = 1/18
    
    var sequenceLenght = 25
    var scrambledSequence : [CubeMoves] = []
    var scrambledSequenceString : String = ""
    var scrambler = Scrambler()
    var checker = Checker()

    @IBOutlet weak var showSequence: UILabel!
    
    @IBOutlet weak var showSequenceLength: UILabel!
    
    @IBOutlet weak var sequenceStepperOutlet: UIStepper!
    
    @IBAction func generateSequence(_ sender: Any) {
        scrambledSequenceString = ""
        scrambledSequence = scrambler.cubeScrambler(sequenceLength: sequenceLenght, intervalLength: intervalLength)
        scrambledSequence = checker.checkSequence(scrambledSequence: scrambledSequence, intervalLength: intervalLength)
        
        for move in scrambledSequence {
            scrambledSequenceString.append(move.rawValue)
            scrambledSequenceString.append(" ")
        }
        
        showSequence.text = scrambledSequenceString
    }
    
    @IBAction func sequenceStepperAction(_ sender: UIStepper) {
        sequenceLenght = Int(sender.value)
        showSequenceLength.text = Int(sender.value).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

