//
//  Colors.swift
//  SkeletonView
//
//  Created by オムラユウキ on 2019/12/16.
//  Copyright © 2019 オムラユウキ. All rights reserved.
//

import UIKit

/*
 MARK: - Default Color Palette
 */
private struct Palette {
    static let extraLightGray: UIColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    static let lightGray: UIColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
    static let white: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

/*
 MARK: - App Generic Colors
 */

struct GeneralColorResources {
    static var viewControllerBackgroundLight: UIColor = Palette.white
    static var loadingPulseLight: UIColor = Palette.extraLightGray
    static var loadingPulseDark: UIColor = Palette.lightGray
}
