//
//  Row.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-03.
//  Copyright © 2015 DeadRatGames. All rights reserved.
//

import UIKit


public class Row : UIView
{
    public var keyboardDelegate: KeyboardDelegate? = nil

    var arrayKeyContainers: [ViewContainer] = []

    class func rowControls() -> Row {
        let load = Load.objectWithClass(Row.self, xib: "RowControls", owner: nil)
        let row = load as! Row
        return row
    }

    class func row9() -> Row {
        let load = Load.objectWithClass(Row.self, xib: "Row9", owner: nil)
        let row = load as! Row
        return row
    }

    class func row10() -> Row {
        let load = Load.objectWithClass(Row.self, xib: "Row10", owner: nil)
        let row = load as! Row
        return row
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        
        for subview in self.subviews {
            if let viewContainer = subview as? ViewContainer {
                self.arrayKeyContainers.append(viewContainer)
            }
        }
    }
    
    func populateWithArrayOfKeys(arrayOfKeys: Array<Key>)
    {
        for viewContainer in self.arrayKeyContainers
        {
            let tag = viewContainer.tag
            let key = arrayOfKeys[tag]
            key.frame = viewContainer.bounds
            viewContainer.addSubview(key)
        }
    }
}