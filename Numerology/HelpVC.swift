//
//  HelpVC.swift
//  Numerology
//
//  Created by Radim Jarosek on 23.09.16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = help_text
        
        
    }
    
    @IBAction func segmentChanged(_ sender: AnyObject) {
        
    }
    
    
    
}
