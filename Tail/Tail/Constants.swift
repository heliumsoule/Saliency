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
        static let second:CGFloat = 1.0
        
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
    
    struct Calibration {
        static let clockFS:CGFloat = 46
        static let clockFW:CGFloat = UIFontWeightThin
        static let startTime:Int = 5
        
        static let centerRatio:CGFloat = 0.4
        
        static let numberOfRows:Int = 2
        static let numberOfCols:Int = 4
        static let secondsPerDot:Double = 2.0
        static let circleDiameter:CGFloat = 0.1
    }
}
