//
//  CalibrationDot.swift
//  Tail
//
//  Created by Jing Lin on 11/1/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class CalibrationDot: UIView {
    
    let centerDot = CALayer()
    var positions:[(CGFloat, CGFloat)] = []
    var indices:[Int] = (0...Constants.Calibration.numberOfRows * Constants.Calibration.numberOfCols).map { $0 }
    var currentIndex:Int = 1
    
    init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.backgroundColor = Constants.General.darkGray.cgColor
        self.centerDot.backgroundColor = Constants.General.compBlue.cgColor
        
//      2.0 because the distance is based on the circleCenter.
        let rowPadding = (2.0 - CGFloat(Constants.Calibration.numberOfCols) * Constants.Calibration.circleDiameter) / CGFloat(Constants.Calibration.numberOfCols + 1)
        let colPadding = (2.0 - CGFloat(Constants.Calibration.numberOfRows) * Constants.Calibration.circleDiameter) / CGFloat(Constants.Calibration.numberOfRows + 1)
        
        for rowIndex in 0..<Constants.Calibration.numberOfRows {
            for colIndex in 0..<Constants.Calibration.numberOfCols {
                let centerX = Constants.Calibration.circleDiameter / 2 + rowPadding + (Constants.Calibration.circleDiameter + rowPadding) * CGFloat(colIndex)
                let centerY = Constants.Calibration.circleDiameter / 2 + colPadding + (Constants.Calibration.circleDiameter + colPadding) * CGFloat(rowIndex)
                
                self.positions.append((centerX, centerY))
            }
        }
        
        self.positions.shuffle()
        
        self.layer.addSublayer(self.centerDot)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius = self.frame.width / 2
        let centerRadius = radius * Constants.Calibration.centerRatio
        
        self.layer.cornerRadius = radius
        self.centerDot.frame = CGRect(x: 0, y: 0, width: 2 * centerRadius, height: 2 * centerRadius)
        self.centerDot.cornerRadius = centerRadius
        self.centerDot.position = CGPoint(x: radius, y: radius)
        
    }
    
    func calibrate() -> ((CGFloat, CGFloat), Bool) {
        let nextPoint = self.positions[self.currentIndex % (Constants.Calibration.numberOfRows * Constants.Calibration.numberOfCols)]
        
        if self.currentIndex < Constants.Calibration.numberOfRows * Constants.Calibration.numberOfCols {
            
            self.currentIndex += 1
            return (nextPoint, true)
        } else {
            
            self.positions.shuffle()
            self.currentIndex = 1
            return (self.positions.first!, false)
        }
        
    }
    
    func shrinkDot(){
        
        let shrink = CABasicAnimation(keyPath: "transform.scale")
        shrink.duration = 3.0
        shrink.speed = 2
        shrink.fillMode = kCAFillModeForwards
        shrink.autoreverses = false
        shrink.fromValue = NSNumber(value: 1)
        shrink.toValue = NSNumber(value: 0.4)
        shrink.autoreverses = false
        shrink.isRemovedOnCompletion = false
        self.centerDot.add(shrink, forKey: "animateDot")
    
    }
    
    func animateDot() {
        shrinkDot();
        /*let fadeIn = CABasicAnimation(keyPath: "opacity")
        fadeIn.duration = 1.0
        fadeIn.autoreverses = false
        fadeIn.fromValue = NSNumber(value: 0.2)
        fadeIn.toValue = NSNumber(value: 1.0)
        fadeIn.fillMode = kCAFillModeBoth
        self.centerDot.add(fadeIn, forKey: "animateDot")
        */
    }
    
}










