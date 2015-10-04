//
//  Key.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-03.
//  Copyright © 2015 DeadRatGames. All rights reserved.
//

import UIKit

class Key: UIView
{
    var characterDefault: NSString?
    var characterShifted: NSString?
    
    class func load(def: String, shifted: String) -> Key {
        let key = Load.objectWithClass(Key) as! Key
        key.withCharacters(def, shifted: shifted)
        return key
    }
    
    func withCharacters(character: String, shifted: String) -> Key {
        self.characterDefault = character
        self.characterShifted = shifted
        return self
    }
    
    func shift(shifted: Bool) {
        
    }
    
}
