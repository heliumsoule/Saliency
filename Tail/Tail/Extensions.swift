//
//  Extensions.swift
//  Tail
//
//  Created by Jing Lin on 11/1/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

extension Array {
    
    mutating func shuffle() {
        
        guard count > 1 else {
            return
        }
        for index in 0..<count - 1 {
            
            let otherIndex = Int(arc4random_uniform(UInt32(count - index))) + index
            if index != otherIndex {
                swap(&self[index], &self[otherIndex])
            }
        }
        
    }
    
}

extension NSLayoutConstraint {
    
    func changeFactor(scaleBy: CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let updatedConstraint = NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: scaleBy, constant: constant)
        NSLayoutConstraint.activate([updatedConstraint])
        
        return updatedConstraint
    }
    
}
