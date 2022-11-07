//
//  File.swift
//
//
//  Created by marwa on 03/08/2022.
//

import Foundation
import SkeletonView
import UIKit

public extension UIView {

    func startSkeletonView() {
        isSkeletonable = true
        showAnimatedGradientSkeleton()
    }

    func stopSkeletonView() {
        stopSkeletonAnimation()
        hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
    }
}
