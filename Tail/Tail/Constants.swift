//
//  Constants.swift
//  Tail
//
//  Created by Jing Lin on 10/31/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit

struct Constants {
    
    struct General {
        static let compBlue:UIColor = UIColor(red: CGFloat(53.0 / 255), green: CGFloat(183.0 / 255), blue: CGFloat(236.0 / 255), alpha: 1.0)
        static let darkGray = UIColor.darkGray
        
        static let inputConfirmationKey = "com.kanwisher.InputConfirmation"
    }
    
    struct SignUp {
        static let titleFS:CGFloat = 40
        static let titleFW:CGFloat = UIFontWeightBold
        static let text:String = "Tail"
        
        static let buttonText:String = "Sign In"
        static let buttonFS:CGFloat = 16.0
        static let buttonCR:CGFloat = 3.0
    }
    
    struct InputForm {
        static let descriptionFS:CGFloat = 18.0
        static let descriptionFW:CGFloat = UIFontWeightThin
        static let text:String = "First, please provide some important information."
        
        static let namePL:String = "Write your full name here."
        static let emailPL:String = "Write your email address here."
        
        static let underlineWidth:CGFloat = 2
        static let buttonRatio:CGFloat = 0.1
        static let padding:CGFloat = 0.4 // Should be at least sqrt(2) - 1
    }
    
}
