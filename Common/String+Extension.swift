//
//  String+Extension.swift
//
//  Created by Christopher Larsen on 2014-11-19.
//

import Foundation

extension String {
    
    public static func fromClass(classType: AnyClass?) -> String {
        
        var returnString = String()
        
        if let classType = classType {
            let classString = NSStringFromClass(classType)
            let range = classString.rangeOfString(".", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start:classString.startIndex, end: classString.endIndex), locale: nil)
            returnString = classString.substringFromIndex(range!.endIndex)
        }
        
        return returnString
    }
    
    public static func localized(string: String) -> String {
        return string.localizedString()
    }
    
    func length () -> (Int) {
        return self.characters.count
    }
    
    func containsString(string: String) -> Bool {
        let range = rangeOfString(string)
        if let checkValidRange = range {
            return !checkValidRange.isEmpty
        }
        return false
    }
    
    func localizedString(comment : String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? self)
    }
    
}