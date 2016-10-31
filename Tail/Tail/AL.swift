//
//  AL.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class AL {
    
    static func verticalSpacingConstraint(topView: UIView, bottomView: UIView, spacing: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: topView, attribute: .bottom, relatedBy: .equal, toItem: bottomView, attribute: .top, multiplier: 1.0, constant: -spacing)
    }
    
    static func horizontalSpacingConstraint(leftView: UIView, rightView: UIView, spacing: CGFloat) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: leftView, attribute: .right, relatedBy: .equal, toItem: rightView, attribute: .left, multiplier: 1.0, constant: -spacing)
    }
    
    static func verticalAlignConstraint(firstView: UIView, secondView: UIView) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView, attribute: .centerY, relatedBy: .equal, toItem: secondView, attribute: .centerY, multiplier: 1.0, constant: 0)
    }
    
    static func horizontalAlignConstraint(firstView: UIView, secondView: UIView) -> NSLayoutConstraint {
        
        return NSLayoutConstraint(item: firstView, attribute: .centerX, relatedBy: .equal, toItem: secondView, attribute: .centerX, multiplier: 1.0, constant: 0)
    }
    
    static func paddingPositionConstraint(view: UIView, side: NSLayoutAttribute, padding: CGFloat) -> NSLayoutConstraint {
        
        let actualPadding = (side == .bottom || side == .right) ? -padding : padding
        
        return NSLayoutConstraint(item: view, attribute: side, relatedBy: .equal, toItem: view.superview!, attribute: side, multiplier: 1.0, constant: actualPadding)
    }
    
    static func paddingPositionConstraints(view: UIView, sides: [NSLayoutAttribute], padding: CGFloat) -> [NSLayoutConstraint] {
        
        return sides.map { paddingPositionConstraint(view: view, side: $0, padding: padding) }
    }
    
    static func fillXConstraint(view: UIView, widthRatio: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view.superview!, attribute: .width, multiplier: widthRatio, constant: 0)
    }
    
    static func fillYConstraint(view: UIView, heightRatio: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: view.superview!, attribute: .height, multiplier: heightRatio, constant: 0)
    }
    
}










