//
//  Font+Style.swift
//
//  Created by ziad on 14/07/2022.
//

import UIKit

// MARK: - Buttons

public extension UIFont {

    static var button: UIFont {
        return UIFont(name: "DMSans-Medium", size: 14)!
    }

    static var smallButton: UIFont {
        return UIFont(name: "DMSans-Medium", size: 12)!
    }
}

// MARK: - labels

public extension UIFont {

    static var title1: UIFont {
        return UIFont(name: "DMSans-Bold", size: 26)!
    }

    static var title2: UIFont {
        return UIFont(name: "DMSans-Bold", size: 20)!
    }

    static var title3: UIFont {
        return UIFont(name: "DMSans-Medium", size: 18)!
    }

    static var callout: UIFont {
        return UIFont(name: "DMSans-Medium", size: 14)!
    }

    static var footnote: UIFont {
        return UIFont(name: "DMSans-Bold", size: 12)!
    }

    static var body: UIFont {
        return UIFont(name: "DMSans-Regular", size: 14)!
    }

    static var caption1: UIFont {
        return UIFont(name: "DMSans-Regular", size: 10)!
    }
}

// MARK: - TextField

public extension UIFont {

    static var textfeild: UIFont {
        return UIFont(name: "DMSans-Medium", size: 14)!
    }
}
