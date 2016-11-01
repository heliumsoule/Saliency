//
//  TailButton.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

class TailButton: UIButton {
    
    init(inputImg: UIImage) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .center
        self.setImage(#imageLiteral(resourceName: "Airplane"), for: .normal)
        
        self.backgroundColor = Constants.General.compBlue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.width / 2
    }
    
}
