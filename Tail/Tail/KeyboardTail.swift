//
//  KeyboardTail.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class KeyboardTail: UIView {
    
    let completeButton = TailButton()
    
    init(inputImg: UIImage) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let inset = UIScreen.main.bounds.width * Constants.InputForm.buttonRatio * Constants.InputForm.padding / 2 // Divide by 2 because of radius
        
        self.completeButton.imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        self.completeButton.setImage(inputImg, for: .normal)
        
        self.addSubview(self.completeButton)
        
        customLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customLayout() {
        
        self.addConstraints(AL.squareWidthConstraints(view: self.completeButton, widthRatio: Constants.InputForm.buttonRatio))
        self.addConstraint(NSLayoutConstraint(item: self.completeButton, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.7, constant: 0))
        self.addConstraint(AL.paddingPositionConstraint(view: self.completeButton, side: .top, padding: 0))
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let heightY = self.completeButton.bounds.height
        let currBounds = self.frame
        
        let lineLayer = CAShapeLayer()
        let point = UIBezierPath()
        
        let startingPoint = CGPoint(x: currBounds.minX, y: heightY / 2)
        let endingPoint = CGPoint(x: currBounds.maxX, y: heightY / 2)
        
        point.move(to: startingPoint)
        point.addLine(to: endingPoint)
        
        lineLayer.path = point.cgPath
        lineLayer.lineWidth = Constants.InputForm.underlineWidth
        lineLayer.strokeColor = Constants.General.darkGray.cgColor
        
        self.layer.insertSublayer(lineLayer, below: self.completeButton.layer)
        
    }
    
}
