//
//  Dispatch.swift
//  Thumperr
//  Created by Christopher Larsen on 2014-11-19.
//

import Foundation
import UIKit

/*
Usage

vay delay :Double = 1000
let block :() -> Void = { [weak self] in
    if let strongSelf = self {
    strongSelf.someMethod()
    }
}
Dispatch.after(delay, closure: block)

or 

Dispatch.after(delay, closure: { [weak self] in
if let strongSelf = self {
strongSelf.nextVibration()
}
})

*/

typealias DispatchBlock = ()->Void

class Dispatch
{
    class func after(delay:Double, closure:()->Void) {
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
        
    }
    
    class func async(priority: Int = DISPATCH_QUEUE_PRIORITY_DEFAULT, closure:()->()) {
        
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            NSOperationQueue.mainQueue().addOperationWithBlock {
                closure()
            }
        }
        
    }
    
    class func toMainThread(closure:()->()) {
        
        dispatch_async(dispatch_get_main_queue()) {
            NSOperationQueue.mainQueue().addOperationWithBlock {
                closure()
            }
        }
        
    }
    
}

var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}

var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
}

var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
}

var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}
