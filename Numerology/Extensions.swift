//
//  Extensions.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit

extension Date {
    var stringValue: String{
        return self.toString()
    }
    
    func toString() -> String {
        let formatter = DateFormatter()
        //formatter.dateFormat = "yyyy'-'MM'-'dd HH':'mm':'ss"
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let str = formatter.string(from: self)
        return str
    }
    
    func toStringShort() -> String {
        let formatter = DateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateFormat = "ddMMyyyy"
        let str = formatter.string(from: self)
        return str
    }

    func toStringDay() -> String {
        let formatter = DateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateFormat = "dd"
        let str = formatter.string(from: self)
        return str
    }

}

extension Int {
    func  toString() -> String {
        return (String(self))
    }
    
}

func addNumbers (Value: String) -> Int {
    let arrayValues = Value.characters.flatMap { Int(String($0)) }
    var result: Int = 0
    
    if (Int(Value) == 11) || (Int(Value) == 22) {
    
        return Int(Value)!
        
    }
    
    for x in arrayValues {
    
       result += x
        
    }
    
    return result
}
