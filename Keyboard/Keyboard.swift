//
//  Keyboard.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-04.
//  Copyright © 2015 DRG. All rights reserved.
//

import UIKit


class Keyboard : UIView
{
    @IBOutlet var rowTop    : ViewContainer!
    @IBOutlet var rowUpper  : ViewContainer!
    @IBOutlet var rowLower  : ViewContainer!
    @IBOutlet var rowBottom : ViewContainer!

    var shiftStatus = ShiftStatus.ShiftStatusOn
    
    func initializeKeyboard()
    {        
        let key_Q = Key.load("q", shifted: "Q")
        let key_W = Key.load("w", shifted: "W")
        let key_E = Key.load("e", shifted: "E")
        let key_R = Key.load("r", shifted: "R")
        let key_T = Key.load("t", shifted: "T")
        let key_Y = Key.load("y", shifted: "Y")
        let key_U = Key.load("u", shifted: "U")
        let key_I = Key.load("i", shifted: "I")
        let key_O = Key.load("o", shifted: "O")
        let key_P = Key.load("p", shifted: "P")
        
        let array_QWERTYUIOP = [key_Q, key_W, key_E, key_R, key_T, key_Y, key_U, key_I, key_O,key_P ]
        
        let loadTop = Load.objectWithClass(Row)
        if let top = loadTop as? Row {
            top.populateWithArrayOfKeys(array_QWERTYUIOP)
            self.rowTop.addSubview(top)
        }
        
    }
}