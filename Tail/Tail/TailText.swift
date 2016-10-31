//
//  TailText.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class TailText: UILabel {
    
    init(fontSize: CGFloat, fontWeight: CGFloat, text: String) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        self.text = text
        self.textColor = UIColor.white
        self.lineBreakMode = .byWordWrapping
        self.textAlignment = .center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(inputText: String) {
        self.text = inputText
    }
    
}
