//
//  StarsView.swift
//
//
//  Created by Ahmed M. Hassan on 14/08/2022.
//

import Cosmos
import Foundation
import UIKit

/// Bridge to access `CosmosView` to avoid coupling in the project
///
public class StarsView: CosmosView {

    public func applyStyleToView(_ rate: Double) {
        rating = rate
        settings.updateOnTouch = false
        settings.starSize = 18
        settings.filledColor = UIColor.systemYellow
        settings.emptyBorderColor = UIColor.darkGray
        settings.filledBorderColor = UIColor.systemYellow
    }
}

