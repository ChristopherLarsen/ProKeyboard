//
//  Row.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-03.
//  Copyright © 2015 DeadRatGames. All rights reserved.
//

import UIKit


class Row : UIView
{
    @IBOutlet var arrayKeyContainers : [ViewContainer]!

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