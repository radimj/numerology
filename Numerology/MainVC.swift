//
//  ViewController.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

var ZivotniCislo: Int = 0
var DusevniCislo: Int = 0

class ViewController: UIViewController {

    @IBOutlet weak var birthDate: UIDatePicker!
    @IBOutlet weak var ButtonZivotniCislo: UIButton!
    @IBOutlet weak var ButtonDatumNarozeni: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDate.setValue(UIColor.white, forKeyPath: "textColor")
        birthDate.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func datePickerValueChanged() {
        calculate()
    }

    @IBAction func calculate() {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day , .month , .year], from: birthDate.date)
        
        let dayStr = components.day?.toString()
        let monStr = components.month?.toString()
        let yeaStr = components.year?.toString()

        DusevniCislo = (VratSoucet(dayStr!) + VratSoucet(monStr!) + VratSoucet(yeaStr!))
        ZivotniCislo = VratSoucet(String(DusevniCislo))
        ButtonZivotniCislo.setTitle(String(ZivotniCislo), for: UIControlState())
        ButtonDatumNarozeni.setTitle(dayStr, for: UIControlState())
        print(DusevniCislo)
        
    }

}

