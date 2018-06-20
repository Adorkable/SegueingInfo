//
//  Utility.swift
//  SegueingInfo
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

import Foundation

extension String {
    
    subscript (index : Int) -> Character {
        return self[ self.index(self.startIndex, offsetBy: index) ]
    }
    
    // TODO: random string without repeat
    // TODO: NSCharacterSet
    public static func randomString(_ length : Int, allowedCharacters : String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890") -> String {
        var result = String()
        
        for _ in 1...length
        {
            let randomCharacterIndex = arc4random_uniform(UInt32(allowedCharacters.count))
            let randomCharacter : Character = allowedCharacters[Int(randomCharacterIndex)]
            result.append(randomCharacter)
        }
        
        return result
    }
}
