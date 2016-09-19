//
//  SecondViewController.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let lineSeparator = "\n\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Add error handling for empty texts
        fetchText(0)
    }
    
    //fetchText - fetch number description from given dictionary: 0 - dict1 (Birth Day Number), 1 - dict2 (Life Number)
    func fetchText(_ dictNumber: Int) {
        switch dictNumber {
        case 0:
            let dayDesc = dict1[ZivotniCislo]![0]
            let dayNature = dict1[ZivotniCislo]![1]
            let dayWeakness = dict1[ZivotniCislo]![2]
            textView.text = dayDesc + lineSeparator
                + dayNature + lineSeparator
                + dayWeakness
            break
        case 1:
            DusevniCislo = Int(arc4random_uniform(8)+1)
            let descPositive = dict2[DusevniCislo]![0]
            let descNegative = dict2[DusevniCislo]![1]
            textView.text = "Číslo duše - \(DusevniCislo)" + lineSeparator + descPositive + lineSeparator
                + descNegative
            break
        default:
            break
        }
    }
    

    @IBAction func tabChanged(_ sender: AnyObject) {
        if segmentedControl.selectedSegmentIndex == 0 {
            fetchText(0)
        }
        
        if segmentedControl.selectedSegmentIndex == 1 {
            fetchText(1)
        }
    }
    
    
}
