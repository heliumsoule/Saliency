//
//  InitialTimerViewController.swift
//  Tail
//
//  Created by Malvika Joshi on 11/26/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class InitialTimerViewController: UIViewController {
    
    let cbutton = UIButton(type: UIButtonType.roundedRect)
    let clockField = TailText(fontSize: Constants.Calibration.clockFS, fontWeight: Constants.Calibration.clockFW, text: "")
    var timer:Timer!
    var currentTime:Int = Constants.Calibration.startTime

    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.white
        
        self.cbutton.translatesAutoresizingMaskIntoConstraints = false
        
        self.cbutton.titleLabel!.font = UIFont.systemFont(ofSize: Constants.Calibrate.buttonFS)
        self.cbutton.setTitle(Constants.Calibrate.buttonText, for: .normal)
        self.cbutton.setTitleColor(UIColor.white, for: .normal)
        
        self.cbutton.layer.cornerRadius = Constants.Calibrate.buttonCR
        self.cbutton.backgroundColor = UIColor.darkGray
        
        self.clockField.textColor = Constants.General.darkGray
        self.clockField.font = UIFont.monospacedDigitSystemFont(ofSize: Constants.Calibration.clockFS, weight: Constants.Calibration.clockFW)
        self.clockField.text = convertSecondsToMinutesSeconds(seconds: Constants.Calibration.startTime)
        
        
        self.view.addSubview(self.clockField)
        self.view.addSubview(self.cbutton)
        
        self.clockField.alpha = 0
        
        customLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customLayout() {
        
        self.view.addConstraint(AL.horizontalAlignConstraint(firstView: self.clockField, secondView: self.view))
        self.view.addConstraint(AL.verticalAlignConstraint(firstView: self.clockField, secondView: self.view))
        
        self.view.addConstraint(AL.fillXConstraint(view: self.cbutton, widthRatio: 0.4))
        self.view.addConstraint(NSLayoutConstraint(item: self.cbutton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.cbutton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let signUpTap = UITapGestureRecognizer()
        signUpTap.numberOfTapsRequired = 1
        signUpTap.addTarget(self, action: #selector(InitialTimerViewController.buttonAction))
        
        self.cbutton.addGestureRecognizer(signUpTap)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func buttonAction(){
        self.cbutton.alpha=0
        self.clockField.alpha = 1

        self.timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: .commonModes)

    }
    
    func updateTimer() {
        
        if self.currentTime > 0 {
            self.currentTime = self.currentTime - 1
            self.clockField.text = convertSecondsToMinutesSeconds(seconds: self.currentTime)
        } else {
            transitionToCheckerboard()
        }
    }
    
    
    func convertSecondsToMinutesSeconds(seconds: Int) -> String {
        return String(format: "%02i:%02i", seconds / 60, seconds % 60)
    }
    
    func transitionToCheckerboard() {
        let secondViewController:CheckerboardViewController = CheckerboardViewController()
        self.present(secondViewController, animated: true, completion: nil)
        
    }
    
}

