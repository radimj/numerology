//
//  ViewController.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

extension Int {
    func  toString() -> String {
        return (String(self))
    }

}

class ViewController: UIViewController {
    
    var ZivotniCislo: Int = 0
    var DusevniCislo: Int = 0
    

    @IBOutlet weak var birthDate: UIDatePicker!
    @IBOutlet weak var ButtonZivotniCislo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDate.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        birthDate.addTarget(self, action: #selector(self.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    
    func datePickerValueChanged() {
        print(birthDate.date)
        
    }

    @IBAction func calculate() {
        
        let str = birthDate.date.toStringShort()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: birthDate.date)
        
        let dayStr = components.day.toString()
        let monStr = components.month.toString()
        let yeaStr = components.year.toString()
        
        print(dayStr)
        print(monStr)
        print(yeaStr)
        print("Hello")

        
        
        DusevniCislo = (VratSoucet(dayStr) + VratSoucet(monStr) + VratSoucet(yeaStr))
        
        ZivotniCislo = VratSoucet(String(DusevniCislo))
        
        
         ButtonZivotniCislo.setTitle(String(ZivotniCislo), forState: UIControlState.Normal)
        

    }


}

