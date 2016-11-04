//
//  CalibrationViewController.swift
//  Tail
//
//  Created by Jing Lin on 11/1/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class CalibrationViewController: UIViewController {
    
    let clockField = TailText(fontSize: Constants.Calibration.clockFS, fontWeight: Constants.Calibration.clockFW, text: "")
    var timer:Timer!
    var currentTime:Int = Constants.Calibration.startTime
    
    let calibrationDot = CalibrationDot()
    var widthConstraint:NSLayoutConstraint!
    var heightConstraint:NSLayoutConstraint!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.white
        
        switchAlphas(shouldCalibrate: false)
        
        self.clockField.textColor = Constants.General.darkGray
        self.clockField.font = UIFont.monospacedDigitSystemFont(ofSize: Constants.Calibration.clockFS, weight: Constants.Calibration.clockFW)
        self.clockField.text = convertSecondsToMinutesSeconds(seconds: Constants.Calibration.startTime)
        
        
        self.view.addSubview(self.clockField)
        self.view.addSubview(self.calibrationDot)
        customLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: .commonModes)
    }
    
    func customLayout() {
        self.view.addConstraint(AL.horizontalAlignConstraint(firstView: self.clockField, secondView: self.view))
        self.view.addConstraint(AL.verticalAlignConstraint(firstView: self.clockField, secondView: self.view))
        
        let point = self.calibrationDot.positions.first!
        
        self.widthConstraint = NSLayoutConstraint(item: self.calibrationDot, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: point.0, constant: 0)
        self.heightConstraint = NSLayoutConstraint(item: self.calibrationDot, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: point.1, constant: 0)
        
        self.view.addConstraints([self.widthConstraint, self.heightConstraint])
        self.view.addConstraints(AL.squareWidthConstraints(view: self.calibrationDot, widthRatio: Constants.Calibration.circleDiameter))
    }
    
    func updateTimer() {
        
        if self.currentTime > 0 {
            self.currentTime = self.currentTime - 1
            self.clockField.text = convertSecondsToMinutesSeconds(seconds: self.currentTime)
        } else {
            self.timer.invalidate()
            self.timer = nil
            
            switchAlphas(shouldCalibrate: true)
            self.calibrationDot.animateDot()
            
            self.timer = Timer(timeInterval: 2.0, target: self, selector: #selector(calibrate), userInfo: nil, repeats: true)
            RunLoop.current.add(self.timer, forMode: .commonModes)
        }
    }
    
    func calibrate() {
        
        let (currentPoint, shouldContinue) = self.calibrationDot.calibrate()
        
        self.widthConstraint = self.widthConstraint.changeFactor(scaleBy: currentPoint.0)
        self.heightConstraint = self.heightConstraint.changeFactor(scaleBy: currentPoint.1)
        
        self.calibrationDot.animateDot()
        
        if !shouldContinue {
            
            self.currentTime = Constants.Calibration.startTime
            self.clockField.text = convertSecondsToMinutesSeconds(seconds: self.currentTime)
            self.timer.invalidate()
            self.timer = nil
            
            self.widthConstraint = self.widthConstraint.changeFactor(scaleBy: currentPoint.0)
            self.heightConstraint = self.heightConstraint.changeFactor(scaleBy: currentPoint.1)
            
            switchAlphas(shouldCalibrate: false)
            
            self.timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(self.timer, forMode: .commonModes)
        }
        
    }
    
    func switchAlphas(shouldCalibrate: Bool) {
        self.clockField.alpha = shouldCalibrate ? 0.0 : 1.0
        self.calibrationDot.alpha = shouldCalibrate ? 1.0 : 0.0
    }
    
    func convertSecondsToMinutesSeconds(seconds: Int) -> String {
        return String(format: "%02i:%02i", seconds / 60, seconds % 60)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
}
