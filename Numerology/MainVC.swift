//
//  ViewController.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

var LifePathNumber: Int = 0
var BirthPathNumber: Int = 0
var dateChoosen: Date?

class ViewController: UIViewController {

    @IBOutlet weak var birthDate: UIDatePicker!
    @IBOutlet weak var buttonShowDetailVC: CustomButton!
    @IBOutlet weak var buttonBirthPathNumber: UIButton!
    @IBOutlet weak var buttonLifePathNumber: UIButton!
    
    @IBOutlet weak var buttonHelp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthDate.setValue(UIColor.white, forKeyPath: "textColor")
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
    }

    @IBAction func calculate() {
       
        /* Store selected date to assign back birthDate when viewWillAppear */
        dateChoosen = birthDate.date
        
        let day = birthDate.date.toStringDay()
        
        BirthPathNumber = Int(day)!
        LifePathNumber = addNumbers(Value: birthDate.date.toStringShort())
        
        /* Final calculation of Life Path Number*/
        LifePathNumber = addNumbers(Value: String(LifePathNumber))
        
        buttonLifePathNumber.setTitle(String(LifePathNumber), for: UIControlState())
        buttonBirthPathNumber.setTitle(day, for: UIControlState())
        
    }

}

