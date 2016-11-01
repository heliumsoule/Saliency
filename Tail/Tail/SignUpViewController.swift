//
//  SignUpViewController.swift
//  Tail
//
//  Created by Jing Lin on 10/28/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    let backgroundImg = UIImageView(frame: UIScreen.main.bounds)
    let appTitle = TailText(fontSize: Constants.SignUp.titleFS, fontWeight: Constants.SignUp.titleFW, text: Constants.SignUp.text)
    let loginButton = UIButton(type: UIButtonType.roundedRect)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.backgroundImg.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.loginButton.titleLabel!.font = UIFont.systemFont(ofSize: Constants.SignUp.buttonFS)
        self.loginButton.setTitle(Constants.SignUp.buttonText, for: .normal)
        self.loginButton.setTitleColor(UIColor.darkGray, for: .normal)
        
        self.loginButton.layer.cornerRadius = Constants.SignUp.buttonCR
        self.loginButton.backgroundColor = UIColor.white
        
        self.backgroundImg.image = #imageLiteral(resourceName: "SignUpBackground")
        self.backgroundImg.contentMode = .scaleToFill

        self.view.addSubview(self.backgroundImg)
        self.view.addSubview(self.appTitle)
        self.view.addSubview(self.loginButton)
        
        customLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customLayout() {
        self.view.addConstraints(AL.paddingPositionConstraints(view: self.backgroundImg, sides: [.left, .top, .right, .bottom], padding: 0))
        self.view.addConstraints(AL.paddingPositionConstraints(view: self.appTitle, sides: [.left, .right], padding: 15))
        self.view.addConstraint(NSLayoutConstraint(item: self.appTitle, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.4, constant: 0))
        
        self.view.addConstraint(AL.fillXConstraint(view: self.loginButton, widthRatio: 0.4))
        self.view.addConstraint(AL.horizontalAlignConstraint(firstView: self.backgroundImg, secondView: self.loginButton))
        self.view.addConstraint(NSLayoutConstraint(item: self.loginButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.6, constant: 0))
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let signUpTap = UITapGestureRecognizer()
        signUpTap.numberOfTapsRequired = 1
        signUpTap.addTarget(self, action: #selector(SignUpViewController.transitionToInput))

        self.loginButton.addGestureRecognizer(signUpTap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func transitionToInput() {
        let navigationBarVC = UINavigationController(rootViewController: InputFormViewController())
        
        self.present(navigationBarVC, animated: true, completion: nil)
    }
    

}

