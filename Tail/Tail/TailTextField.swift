//
//  TailTextField.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class TailTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        self.tintColor = Constants.General.compBlue
        self.translatesAutoresizingMaskIntoConstraints = false
        self.autocorrectionType = .no
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let startingPoint = CGPoint(x: rect.minX, y: rect.maxY - Constants.InputForm.underlineWidth / 2)
        let endingPoint = CGPoint(x: rect.maxX, y: rect.maxY - Constants.InputForm.underlineWidth / 2)
        
        let path = UIBezierPath()
        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        
        path.lineWidth = Constants.InputForm.underlineWidth
        
        tintColor.setStroke()
        path.stroke()
    }
    
}
