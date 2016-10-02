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
        //playAudio()

    }
    

  
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
             self.textView.scrollRangeToVisible(NSRange(location: 0,length: 0))
        }
        

    }
    
    //fetchText - fetch number description from given dictionary: 0 - dict1 (Birth Path Number), 1 - dict2 (Life Path Number)
    func fetchText(_ dictNumber: Int) {
        switch dictNumber {
        case 0:
            let dayDesc = dict1[birthDayNumber]![0]
            let dayNature = dict1[birthDayNumber]![1]
            let dayWeakness = dict1[birthDayNumber]![2]
            textView.text = "Číslo dne narození - \(birthDayNumber) - " + dayDesc + lineSeparator
                + dayNature + lineSeparator
                + dayWeakness
            textView.scrollRangeToVisible(NSRange(location: 0,length: 0))
            
            break
        case 1:
            //Select eg. 26.11.2016 - there's an error for lifePathNumber - 10
            let descPositive = dict2[lifePathNumber]![0]
            let descNegative = dict2[lifePathNumber]![1]
            textView.text = "Životní číslo - \(lifePathNumber)" + lineSeparator + descPositive + lineSeparator
                    + descNegative
            textView.scrollRangeToVisible(NSRange(location: 0,length: 0))
            
            break
        default:
            break
        }
    }
    

    @IBAction func tabChanged(_ sender: AnyObject) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            fetchText(0)
           // textView.scrollRangeToVisible(NSRange(location: 0,length: 0))
            
            
        }
        
        if segmentedControl.selectedSegmentIndex == 1 {
            fetchText(1)
          //  textView.scrollRangeToVisible(NSRange(location: 0,length: 0))
            
        }
    }
    
    
}
