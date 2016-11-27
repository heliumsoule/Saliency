//
//  CheckerboardViewController.swift
//  Tail
//
//  Created by Malvika Joshi on 11/25/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class CheckerboardViewController: UIViewController {
    
    let dotButton = UIButton(type: UIButtonType.roundedRect)
    let imageView = UIImageView(image: UIImage(named: "CheckerImage.png")!)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.white
        
        self.dotButton.translatesAutoresizingMaskIntoConstraints = false

        self.dotButton.titleLabel!.font = UIFont.systemFont(ofSize: Constants.Checkerboard.buttonFS)
        self.dotButton.setTitle(Constants.Checkerboard.buttonText, for: .normal)
        self.dotButton.setTitleColor(UIColor.white, for: .normal)
        
        self.dotButton.layer.cornerRadius = Constants.Checkerboard.buttonCR
        self.dotButton.backgroundColor = UIColor.darkGray

        self.dotButton.center = view.center
        
        self.view.addSubview(self.dotButton)

        self.imageView.frame = CGRect(x:0 , y: self.view.frame.height/20 , width: self.view.frame.width, height: self.view.frame.width);
        self.view.addSubview(self.imageView)
        
        customLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customLayout() {
        
        self.view.addConstraint(AL.fillXConstraint(view: self.dotButton, widthRatio: 0.4))
        self.view.addConstraint(NSLayoutConstraint(item: self.dotButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.dotButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.7, constant: 0))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let signUpTap = UITapGestureRecognizer()
        signUpTap.numberOfTapsRequired = 1
        signUpTap.addTarget(self, action: #selector(CheckerboardViewController.transitionToCalibration))
        
        self.dotButton.addGestureRecognizer(signUpTap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func transitionToCalibration() {
        
        let secondViewController:CalibrationViewController = CalibrationViewController()
        self.present(secondViewController, animated: true, completion: nil)

    }
    
}

