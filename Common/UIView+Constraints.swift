//
//  UIView+LayoutConstrain.m
//
//  Created by Alex Christodoulou on 2013-06-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

import UIKit

extension UIView
{
    
    func disableAutoresizing() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constrainChildView(childView:UIView, attribute: NSLayoutAttribute, constant:CGFloat)
    {
        childView.disableAutoresizing()
        
        let constraint = NSLayoutConstraint(item: self,
            attribute: attribute,
            relatedBy: .Equal,
            toItem: childView,
            attribute: attribute,
            multiplier: 1.0,
            constant: constant)
        
        self.addConstraint(constraint)
    }
    
    func constrainChildViewTopLeftBottomRight(childView:UIView)
    {
        childView.disableAutoresizing()
        
        let constraintTop = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: .Equal,
            toItem: childView,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 0.0)

        let constraintBottom = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: .Equal,
            toItem: childView,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0.0)
        
        let constraintLeft = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Left,
            relatedBy: .Equal,
            toItem: childView,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: 0.0)
        
        let constraintRight = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Right,
            relatedBy: .Equal,
            toItem: childView,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: 0.0)
        
        self.addConstraints([constraintTop, constraintBottom, constraintLeft, constraintRight])
        
        self.needsUpdateConstraints()
    }
}
