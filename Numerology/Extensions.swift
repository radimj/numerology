//
//  Extensions.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

extension NSDate {
    var stringValue: String{
        return self.toString()
    }
    
    func toString() -> String {
        let formatter = NSDateFormatter()
        //formatter.dateFormat = "yyyy'-'MM'-'dd HH':'mm':'ss"
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let str = formatter.stringFromDate(self)
        return str
    }
    
    func toStringShort() -> String {
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateFormat = "dd.MM.yyyy"
        let str = formatter.stringFromDate(self)
        return str
    }
    

     
    
}


func VratSoucet (Hodnota: String) -> Int {
    
    let PoleHodnot = Hodnota.characters.flatMap { Int(String($0)) }
    
    var result: Int = 0
    
    for x in PoleHodnot {
        
        result += x
        
    }
    
    return result
}
