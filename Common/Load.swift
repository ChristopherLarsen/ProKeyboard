//
//  Load.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-03.
//  Copyright © 2015 DeadRatGames. All rights reserved.
//

import UIKit

class Load
{
    
    class func objectWithClass(objClass: AnyClass) -> AnyObject
    {
        return Load.objectWithClass(objClass, xib: String.fromClass(objClass), owner: nil)
    }
    
    class func objectWithClass(objClass: AnyClass, xib: String, owner: AnyObject?) -> AnyObject
    {
        let arrayXibObjects = NSBundle.mainBundle().loadNibNamed(xib, owner: owner, options: nil)
        
        for object in arrayXibObjects {
            if object.isKindOfClass(objClass) {
                return object;
            }
        }
        
        print("ERROR: Failed to load class \(String.fromClass(objClass)) from nib file: \(xib)", terminator: "");
        kill(getpid(), SIGSTOP);
        
        let emptyObj = NSObject()
        
        return emptyObj;
    }
    
}
