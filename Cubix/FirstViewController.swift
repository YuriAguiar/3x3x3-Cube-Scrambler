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
    
    let intervalLength: Float = 1/18
    
    var sequenceLength = 25
    var numberOfSequences = 1
    var lengthAndNumberOfSequences = [["25", "50", "75", "100"], ["1", "2", "3", "4", "5"]]
    var scrambledSequence: [CubeMoves] = []
    var scrambledSequenceString = ""
    var scrambler = Scrambler()
    var checker = Checker()
    var formatter = Formatter()
    
    @IBOutlet weak var scrambleButton: UIButton!
    
    @IBOutlet weak var showScrambledSequence: UITextView!
    
    @IBOutlet weak var separateSequence: UISwitch!
    
    @IBAction func generateSequence(_ sender: Any) {
        showScrambledSequence.text = formatter.repeater(sequenceLength: sequenceLength, intervalLength: intervalLength, numberOfSequeneces: numberOfSequences, separateSequenceSwitch: separateSequence.isOn)

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lengthAndNumberOfSequences[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lengthAndNumberOfSequences[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && row == 0 {
            sequenceLength = 25
        } else if component == 0 && row == 1 {
            sequenceLength = 50
        } else if component == 0 && row == 2 {
            sequenceLength = 75
        } else if component == 0 && row == 3 {
            sequenceLength = 100
        } else if component == 1 && row == 0 {
            numberOfSequences = 1
        } else if component == 1 && row == 1 {
            numberOfSequences = 2
        } else if component == 1 && row == 2 {
            numberOfSequences = 3
        } else if component == 1 && row == 3 {
            numberOfSequences = 4
        } else if component == 1 && row == 4 {
            numberOfSequences = 5
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        showScrambledSequence.textColor = UIColor.blue
        self.separateSequence.setOn(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

