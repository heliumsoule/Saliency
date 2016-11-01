//
//  InputFormViewController.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class InputFormViewController: UIViewController {
    
    let descriptionText = TailText(fontSize: Constants.InputForm.descriptionFS, fontWeight: Constants.InputForm.descriptionFW, text: Constants.InputForm.text)
    let nameField = TailTextField()
    let emailField = TailTextField()
    
    let keyboardContainer = KeyboardTail(inputImg: #imageLiteral(resourceName: "Airplane"))
    var heightConstraint:NSLayoutConstraint!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = []
        
        self.descriptionText.textAlignment = .left
        self.descriptionText.textColor = UIColor.darkGray
        
        self.nameField.placeholder = Constants.InputForm.namePL
        self.emailField.placeholder = Constants.InputForm.emailPL
        
        self.view.addSubview(descriptionText)
        self.view.addSubview(self.nameField)
        self.view.addSubview(self.emailField)
        self.view.addSubview(self.keyboardContainer)
        
        customLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(InputFormViewController.dismissViewController))
        
        self.view.backgroundColor = UIColor.white
        
    }
    
    func customLayout() {
        
        self.view.addConstraints(AL.paddingPositionConstraints(view: self.descriptionText, sides: [.left, .right], padding: 24))
        self.view.addConstraint(AL.paddingPositionConstraint(view: self.descriptionText, side: .top, padding: 30))
        
        self.view.addConstraint(AL.verticalSpacingConstraint(topView: self.descriptionText, bottomView: self.nameField, spacing: 20))
        self.view.addConstraints(AL.paddingPositionConstraints(view: self.nameField, sides: [.left, .right], padding: 24))
        
        self.view.addConstraint(AL.verticalSpacingConstraint(topView: self.nameField, bottomView: self.emailField, spacing: 20))
        self.view.addConstraints(AL.paddingPositionConstraints(view: self.emailField, sides: [.left, .right], padding: 24))
        
        self.view.addConstraints(AL.paddingPositionConstraints(view: self.keyboardContainer, sides: [.left, .right], padding: 0))
        
        self.heightConstraint = AL.paddingPositionConstraint(view: self.keyboardContainer, side: .bottom, padding: 0)
        self.view.addConstraint(self.heightConstraint)
        
        self.view.addConstraint(NSLayoutConstraint(item: self.keyboardContainer, attribute: .height, relatedBy: .equal, toItem: self.keyboardContainer.completeButton, attribute: .width, multiplier: 1.5, constant: 0))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.navigationBar.backgroundColor = UIColor.white
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = UIColor.darkGray
        
        NotificationCenter.default.addObserver(self, selector: #selector(InputFormViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(InputFormViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let dismissKeyboardTap = UITapGestureRecognizer()
        dismissKeyboardTap.numberOfTapsRequired = 1
        dismissKeyboardTap.addTarget(self, action: #selector(InputFormViewController.dismissKeyboard))
        
        self.view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    func dismissViewController() {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(_ notification: NSNotification) {
        let userInfo = (notification.userInfo as! [String: AnyObject])
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let endHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect).height
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .beginFromCurrentState, animations: {
            
            self.heightConstraint!.constant = -endHeight
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        let userInfo = (notification.userInfo as! [String: AnyObject])
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue

        UIView.animate(withDuration: duration, delay: 0.0, options: .beginFromCurrentState, animations: {
            
            self.heightConstraint!.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}









