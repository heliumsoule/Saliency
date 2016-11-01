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
    
    let completeButton = TailButton(inputImg: #imageLiteral(resourceName: "Airplane"))
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.edgesForExtendedLayout = []
        self.completeButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.descriptionText.textAlignment = .left
        self.descriptionText.textColor = UIColor.darkGray
        
        self.nameField.placeholder = Constants.InputForm.namePL
        self.emailField.placeholder = Constants.InputForm.emailPL
        
        let inset = UIScreen.main.bounds.width * Constants.InputForm.buttonRatio * Constants.InputForm.padding / 2 // Divide by 2 because of radius
        
        self.completeButton.imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        self.view.addSubview(descriptionText)
        self.view.addSubview(self.nameField)
        self.view.addSubview(self.emailField)
        self.view.addSubview(self.completeButton)
        
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
        
        self.view.addConstraints(AL.squareWidthConstraints(view: self.completeButton, widthRatio: Constants.InputForm.buttonRatio))
        self.view.addConstraint(AL.paddingPositionConstraint(view: self.completeButton, side: .bottom, padding: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.completeButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.7, constant: 0))
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
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func dismissViewController() {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func keyboardWillShow() {
        
    }
    
    func keyboardWillHide() {
        
    }
    
}









