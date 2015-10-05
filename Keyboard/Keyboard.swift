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
    @IBOutlet var containerControls : ViewContainer!
    @IBOutlet var container0 : ViewContainer!
    @IBOutlet var container1 : ViewContainer!
    @IBOutlet var container2 : ViewContainer!
    @IBOutlet var container3 : ViewContainer!
    @IBOutlet var container4 : ViewContainer!
    @IBOutlet var container5 : ViewContainer!
    @IBOutlet var container6 : ViewContainer!
    @IBOutlet var container7 : ViewContainer!
    @IBOutlet var container8 : ViewContainer!
    
    public var keyboardDelegate: KeyboardDelegate? = nil
    
    var shiftStatus = ShiftStatus.ShiftStatusOn
    
    func loadRows()
    {
        let rowControls = Row.rowControls()
        self.containerControls.addSubview(rowControls)
        self.containerControls.constrainChildViewTopLeftBottomRight(rowControls)
        
        let rowLetters0 = Row.row9()
        let arrayLetters0 = Characters.sharedInstance.rowLetters0()
        self.loadRow(container0, row: rowLetters0, characters: arrayLetters0)

        let rowLetters1 = Row.row9()
        let arrayLetters1 = Characters.sharedInstance.rowLetters1()
        self.loadRow(container1, row: rowLetters1, characters: arrayLetters1)
        
        let rowLetters2 = Row.row10()
        let arrayLetters2 = Characters.sharedInstance.rowLetters2()
        self.loadRow(container2, row: rowLetters2, characters: arrayLetters2)

        rowLetters0.backgroundColor = UIColor.greenColor()
    }
    
    private func loadRow(container: ViewContainer, row: Row, characters: Array<String>)
    {
        row.frame = container.bounds
        let arrayKeys = Key.keysForLetters(characters)
        row.populateWithArrayOfKeys(arrayKeys)
        container.addSubview(row)
        container.constrainChildViewTopLeftBottomRight(row)
    }
    
}