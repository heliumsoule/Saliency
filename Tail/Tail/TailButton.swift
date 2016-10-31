//
//  TailButton.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class TailButton: UIButton {
    
    init(inputText: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(inputText, for: .normal)
        
        self.titleLabel!.textAlignment = .center
        self.titleLabel!.font = UIFont.systemFont(ofSize: fontSize)
        self.setTitleColor(UIColor.black, for: .normal)
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = Constants.SignUp.buttonCR
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
