//
//  ViewController.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

var lifePathNumber: Int = 0
var birthDayNumber: Int = 0
var dateChoosen: Date?

class ViewController: UIViewController {

    @IBOutlet weak var birthDate: UIDatePicker!
    @IBOutlet weak var buttonShowDetailVC: CustomButton!
    @IBOutlet weak var labelBirthDay: UILabel!
    @IBOutlet weak var labelLifePathNumber: UILabel!
    @IBOutlet weak var buttonHelp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        dataTest(dictNumber: 1)
//        dataTest(dictNumber: 2)
        
        birthDate.setValue(UIColor.white, forKeyPath: "textColor")
        birthDate.setValue(true, forKeyPath: "highlightsToday")
        birthDate.performSelector(inBackground: Selector(("setHighlightsToday:")), with: UIColor.white)
        birthDate.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /* Set selected date to brithDate dataPicker */
        if dateChoosen != nil {
           birthDate.setDate (dateChoosen! ,animated: false)
           datePickerValueChanged()
        }
    }
    
    func datePickerValueChanged() {
        calculate()
        buttonShowDetailVC.isEnabled = true
        buttonShowDetailVC.alpha = 1
    }

    @IBAction func calculate() {
        dateChoosen = birthDate.date
        let day = birthDate.date.toStringDay()
        birthDayNumber = Int(day)!
        lifePathNumber = getLifePathNumber(dateStr: birthDate.date.toStringShort())
        labelBirthDay.text = Int(day)?.toString()
        labelLifePathNumber.text = String(lifePathNumber)
    }

}

