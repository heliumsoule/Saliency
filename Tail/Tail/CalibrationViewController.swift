//
//  CalibrationViewController.swift
//  Tail
//
//  Created by Jing Lin on 11/1/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class CalibrationViewController: UIViewController {
    
    let clockField = TailText(fontSize: Constants.Calibration.clockFS, fontWeight: Constants.Calibration.clockFW, text: String(Constants.Calibration.startTime))
    var timer:Timer!
    var currentTime:Int = Constants.Calibration.startTime
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.white
        self.clockField.textColor = Constants.General.darkGray
        
        self.view.addSubview(self.clockField)
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
    }
    
    func updateTimer() {
        
        if self.currentTime > 0 {
            self.currentTime = self.currentTime - 1
            self.clockField.text = String(self.currentTime)
        } else {
            print("Should be calibrating now")
            
            self.currentTime = Constants.Calibration.startTime
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
