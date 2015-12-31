//
//  Utility.swift
//  SegueingInfo
//
//  Created by Ian Grossberg on 12/3/15.
//  Copyright © 2015 Adorkable. All rights reserved.
//

import Foundation

// TODO: Unit Test for Utility.swift
public func random_UInt32() -> UInt32
{
    return arc4random()
}

extension String {
    
    subscript (index : Int) -> Character {
        return self[ self.startIndex.advancedBy(index) ]
    }
    
    // TODO: random string without repeat
    // TODO: NSCharacterSet
    public static func randomString(length : Int, allowedCharacters : String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890") -> String {
        var result = String()
        
        for _ in 1...length
        {
            let randomCharacterIndex = Int(random_UInt32()) % allowedCharacters.characters.count
            let randomCharacter : Character = allowedCharacters[randomCharacterIndex]
            result.append(randomCharacter)
        }
        
        return result
    }
}
