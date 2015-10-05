//
//  Characters.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-04.
//  Copyright © 2015 DRG. All rights reserved.
//

import UIKit

public class Characters
{
    static let sharedInstance = Characters()
    
    var characters = Dictionary<String,String>()
    
    init() {
        
        characters["q"] = "Q"
        characters["w"] = "W"
        characters["e"] = "E"
        characters["r"] = "R"
        characters["t"] = "T"
        characters["y"] = "Y"
        characters["u"] = "U"
        characters["i"] = "I"
        characters["o"] = "O"
        characters["p"] = "P"
        
        characters["a"] = "A"
        characters["s"] = "S"
        characters["d"] = "D"
        characters["f"] = "F"
        characters["g"] = "G"
        characters["h"] = "H"
        characters["j"] = "J"
        characters["k"] = "K"
        characters["l"] = "L"
        
        characters["z"] = "Z"
        characters["x"] = "X"
        characters["c"] = "C"
        characters["v"] = "V"
        characters["b"] = "B"
        characters["n"] = "N"
        characters["m"] = "M"
        
    }
    
    public func shifted(character: String) -> String {
        return characters[character] ?? ""
    }
    
    public func rowLetters0 () -> [String] {
        return ["Sh", "z", "x", "c", "v", "b", "n", "m", "Del"]
    }
    
    public func rowLetters1 () -> [String] {
        return ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    }
    
    public func rowLetters2 () -> [String] {
        return ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    }
    
    public func rowNumbers0 () -> [String] {
        return ["#+=", " ", ".", ",", "?", "!", "'", "DEL"]
    }
    
    public func rowNumbers1 () -> [String] {
        return ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""]
    }
    
    public func rowNumbers2 () -> [String] {
        return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    }
    
    public func rowSymbols1 () -> [String] {
        return ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "•"]
    }
    
    public func rowSymbols2 () -> [String] {
        return ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="]
    }
    
}