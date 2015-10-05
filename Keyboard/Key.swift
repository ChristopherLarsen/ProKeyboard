//
//  Key.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-03.
//  Copyright © 2015 DeadRatGames. All rights reserved.
//

import UIKit

public class Key: UIView
{
    @IBOutlet var labelKey: UILabel!
    
    var characterDefault: String = ""
    var characterShifted: String = ""
    
    class func keysForLetters(arrayCharacters: Array<String>) -> Array<Key> {
        
        var arrayKeys : Array<Key> = []
        
        for character in arrayCharacters {
            
            let loadKey = Load.objectWithClass(Key)
            let key = loadKey as! Key
            
            key.populateCharacters(character, shifted: Characters.sharedInstance.shifted(character))
            arrayKeys.append(key)
            
        }
        
        return arrayKeys
    }
    
    class func load(character: String, shifted: String) -> Key {
        let loadKey = Load.objectWithClass(Key)
        let key = loadKey as! Key
        key.populateCharacters(character, shifted: shifted)
        return key
    }
    
    public func shift(shifted: Bool) {
        labelKey.text = shifted ? characterShifted : characterDefault
    }
    
    func populateCharacters(character: String, shifted: String) {
        self.characterDefault = character
        self.characterShifted = shifted
        self.labelKey.text = self.characterDefault
    }
    
}
