//
//  FirstViewController.swift
//  Cubix
//
//  Created by Yuri Aguiar on 29/01/17.
//  Copyright © 2017 Yuri Aguiar. All rights reserved.
//

import UIKit
import QuartzCore

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let intervalLength : Float = 1/18
    
    var sequenceLenght = 25
    var availableSequenceLengths = ["25", "50", "75", "100"]
    var scrambledSequence : [CubeMoves] = []
    var scrambledSequenceString : String = ""
    var scrambler = Scrambler()
    var checker = Checker()
    
    @IBOutlet weak var scrambleButton: UIButton!
    
    @IBOutlet weak var showScrambledSequence: UITextView!
    
    @IBAction func generateSequence(_ sender: Any) {
        scrambledSequenceString = ""
        scrambledSequence = scrambler.cubeScrambler(sequenceLength: sequenceLenght, intervalLength: intervalLength)
        scrambledSequence = checker.checkSequence(scrambledSequence: scrambledSequence, intervalLength: intervalLength)
        
        for move in scrambledSequence {
            scrambledSequenceString.append(move.rawValue)
            scrambledSequenceString.append(" ")
        }
        
        showScrambledSequence.text = scrambledSequenceString
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableSequenceLengths.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return availableSequenceLengths[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            sequenceLenght = 25
        } else if row == 1 {
            sequenceLenght = 50
        } else if row == 2 {
            sequenceLenght = 75
        } else {
            sequenceLenght = 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showScrambledSequence.textColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

