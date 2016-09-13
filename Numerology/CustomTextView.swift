//
//  CustomTextView.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
     self.layer.cornerRadius = 5.0
     self.layer.borderColor = UIColor.whiteColor().CGColor
     self.layer.borderWidth = 1.0
    }
 

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.0
    }
    
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.0
    }
}
