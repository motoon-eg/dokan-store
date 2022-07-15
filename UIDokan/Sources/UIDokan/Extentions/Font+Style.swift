//
//  Font+Style.swift
//  
//
//  Created by ziad on 14/07/2022.
//

import UIKit


// MARK: - Buttons
//
public extension UIFont {
    
    class var button: UIFont {
        return UIFont(name: "DMSans-Medium", size: 14)!
    }
    
    class var smallButton: UIFont {
        return UIFont(name: "DMSans-Medium", size: 12)!
    }
}


// MARK: - labels
//
public extension UIFont {
    
    class var title1: UIFont {
        return UIFont(name: "DMSans-Bold", size: 26)!
    }
    
    class var title2: UIFont {
        return UIFont(name: "DMSans-Bold", size: 20)!
    }
    
    class var title3: UIFont {
        return UIFont(name: "DMSans-Medium", size: 18)!
    }
    
    class var callOut: UIFont {
        return UIFont(name: "DMSans-Medium", size: 14)!
    }
    
    class var footnote: UIFont {
        return UIFont(name: "DMSans-Bold", size: 12)!
    }

    class var body: UIFont {
        return UIFont(name: "DMSans-Regular", size: 14)!
    }

    class var caption1: UIFont {
        return UIFont(name: "DMSans-Regular", size: 10)!
    }
}

// MARK: - TextField
//
public extension UIFont {
    
    class var textFeild: UIFont {
        return UIFont(name: "DMSans-Medium", size: 14)!
    }
    
}
