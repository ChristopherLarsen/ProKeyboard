//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Christopher Larsen on 2015-10-04.
//  Copyright © 2015 DRG. All rights reserved.
//

import UIKit

public enum Command {
    case CommandShift
    case CommandNextKeyboard
    case CommandSpace
}

public protocol KeyboardDelegate {
    func actionSelectCommand(command: Command)
    func actionSelectKey(key: String)
}

class KeyboardViewController: UIInputViewController, KeyboardDelegate {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadKeyboard()
        self.addNextKeyboardKey()
    }
    
    func loadKeyboard() {
        
        let load = Load.objectWithClass(Keyboard)
        
        if let keyboard = load as? Keyboard {
            
            keyboard.keyboardDelegate = self
            keyboard.frame = self.view.frame
            self.view.addSubview(keyboard)
            self.view.constrainChildViewTopLeftBottomRight(keyboard)
            keyboard.constrainHeight(216)
            
            keyboard.loadRows()
            
        }
        
    }
    
    func addNextKeyboardKey() {
        
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
    }
    
    override func textWillChange(textInput: UITextInput?) {
    }
    
    override func textDidChange(textInput: UITextInput?)
    {
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        
        self.nextKeyboardButton?.setTitleColor(textColor, forState: .Normal)
    }
    
    func shift() {
        
    }
    
    // mark - KeyboardDelegate
    
    func actionSelectCommand(command: Command)
    {
        switch (command)
        {
        case .CommandShift:
            self.shift()
        case .CommandSpace:
            self.textDocumentProxy.insertText(" ")
        case .CommandNextKeyboard:
            self.advanceToNextInputMode()
        }
    }
    
    func actionSelectKey(key: String)
    {
        self.textDocumentProxy.insertText(key)
    }    
    
}
