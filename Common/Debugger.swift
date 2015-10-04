//
//  Debugger.swift
//  Thumperr
//
//  Created by Christopher Larsen on 2015-04-11.
//  Copyright (c) 2015 DRG. All rights reserved.
//

import Foundation
import UIKit

class Print {

    static func ln(objClass :AnyObject, msg :String) {
        print( "\(_stdlib_getDemangledTypeName(objClass)) " + msg)
    }
    
}

