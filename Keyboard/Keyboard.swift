//
//  Keyboard.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-04.
//  Copyright © 2015 DRG. All rights reserved.
//

import UIKit

public class Keyboard : UIView
{
    @IBOutlet var rowControls : ViewContainer!
    @IBOutlet var row0 : ViewContainer!
    @IBOutlet var row1 : ViewContainer!
    @IBOutlet var row3 : ViewContainer!
    @IBOutlet var row4 : ViewContainer!
    @IBOutlet var row5 : ViewContainer!
    @IBOutlet var row6 : ViewContainer!
    @IBOutlet var row7 : ViewContainer!
    @IBOutlet var row8 : ViewContainer!
    
    var shiftStatus = ShiftStatus.ShiftStatusOn
    
    public func loadRows()
    {
        let rowLetters0 = Row.row10()
        let arrayLetters0 = Characters.sharedInstance.rowLetters0()
        let keysLetters0 = Key.keysForLetters(arrayLetters0)
        
        rowLetters0.frame = self.row0.frame
        rowLetters0.layoutSubviews()
        rowLetters0.populateWithArrayOfKeys(keysLetters0)
        
        self.row0.addSubview(rowLetters0)
        
        rowLetters0.backgroundColor = UIColor.greenColor()
    }
    
}