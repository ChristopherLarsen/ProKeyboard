//
//  Debug.swift
//  Thumperr
//
//  Created by Christopher Larsen on 2015-04-13.
//  Copyright (c) 2015 DRG. All rights reserved.
//

import Foundation
import UIKit

public func StringFromClass(aClass: AnyClass!) -> String! {
    return NSStringFromClass(aClass)
}

public func Log<T>(
    object: T,
    filename: String = __FILE__,
    line: Int = __LINE__,
    funcname: String = __FUNCTION__) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SSS"
        let process = NSProcessInfo.processInfo()
        print("[\(process) \(filename) Line:\(line) \(funcname)] \(object)")
}

public func LogFullInfo<T>(
    object: T,
    filename: String = __FILE__,
    line: Int = __LINE__,
    funcname: String = __FUNCTION__) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss:SSS"
        let process = NSProcessInfo.processInfo()
        let threadId = NSThread.currentThread().threadDictionary
        print("\(dateFormatter.stringFromDate(NSDate())) \(process.processName) [\(process.processIdentifier):\(threadId)] \(filename)(\(line)) \(funcname):\r\t\(object)")
        
}

public func AssertNotNil(object :AnyObject?, msg :NSString = "") {
    if (object == nil) {
        Log("Object cannot be nil. " + (msg as String))
        kill(getpid(), SIGSTOP)
    }
}
