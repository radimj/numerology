//
//  CustomButton.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton:UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    //Normal state bg and border
    @IBInspectable var normalBorderColor: UIColor? {
        didSet {
            layer.borderColor = normalBorderColor?.CGColor
        }
    }
    
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            setBgColorForState(normalBackgroundColor, forState: .Normal)
        }
    }
    
    
    //Highlighted state bg and border
    @IBInspectable var highlightedBorderColor: UIColor?
    
    @IBInspectable var highlightedBackgroundColor: UIColor? {
        didSet {
            setBgColorForState(highlightedBackgroundColor, forState: .Highlighted)
        }
}

    private func setBgColorForState(color: UIColor?, forState: UIControlState){
        if color != nil {
            setBackgroundImage(UIImage.imageWithColor(color!), forState: forState)
            
        } else {
            setBackgroundImage(nil, forState: forState)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 5
        clipsToBounds = true
        
        if borderWidth > 0 {
            if state == .Normal && !CGColorEqualToColor(layer.borderColor, normalBorderColor?.CGColor) {
                layer.borderColor = normalBorderColor?.CGColor
            } else if state == .Highlighted && highlightedBorderColor != nil{
                layer.borderColor = highlightedBorderColor!.CGColor
            }
        }
    }
    
}

//Extension Required by RoundedButton to create UIImage from UIColor
extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), false, 1.0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}