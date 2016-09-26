//
//  Extensions.swift
//  Numerology
//
//  Created by Robert Sibek on 12/09/16.
//  Copyright © 2016 sibek. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer = AVAudioPlayer()

extension Date {
    var stringValue: String{
        return self.toString()
    }
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        let str = formatter.string(from: self)
        return str
    }
    
    func toStringShort() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy"
        let str = formatter.string(from: self)
        return str
    }

    func toStringDay() -> String {
        let formatter = DateFormatter()
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

func getLifePathNumber(dateStr: String) -> Int {
    let values = [1,2,3,4,5,6,7,8,9,11,22]
    var finished = false
    var date = dateStr
    var x = 0
    
    repeat {
        x = addNumbers(Value: date)
        if values.contains(x) {
            finished = true
        } else {
            date = "\(x)"
        }
    } while finished == false
    
    return x
}

func playAudio() {
    let audioPath = Bundle.main.path(forResource: "magic", ofType: "mp3")!
    do {
        try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
        player.play()
    } catch let err as NSError {
        print(err.debugDescription)
    }
}

