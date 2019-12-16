//
//  Sizes.swift
//  SkeletonView
//
//  Created by オムラユウキ on 2019/12/16.
//  Copyright © 2019 オムラユウキ. All rights reserved.
//

import UIKit
/**
 MARK: - UI Margins
 */
struct UIMarginResource {
    /** 0.0 */
    static var none: CGFloat = 0.00

    /** 2.0 */
    static var smallest: CGFloat = 2.0

    /** 4.0 */
    static var smaller: CGFloat = 4.0

    /** 8.0 */
    static var small: CGFloat = 8.0

    /** 12.0 */
    static var medium: CGFloat = 12.0

    /** 18.0 */
    static var large: CGFloat = 18.0

    /** 24.0 */
    static var larger: CGFloat = 24.0

    /** 32.0 */
    static var largest: CGFloat = 32.0
    init() {}
}

/**
 MARK: - UI Sizes
 */

struct UISizeResource {

    /** 55.0 */
    static var tableViewSectionHeaderHeight: CGFloat = 55.0

    /** 10.0 */
    static var searchFieldCornerRadius: CGFloat = 10.0

    /** 4.0 */
    static var standardCornerRadius: CGFloat = 4.0

    /** 2.0 */
    static var smallCornerRadius: CGFloat = 2.0

    /** 0.0 */
    static var zeroCornerRadius: CGFloat = 0.0

    /** 0.0 */
    static var zeroBorderWidth: CGFloat = 0.0

    /** 1.0 */
    static var standardBorderWidth: CGFloat = 1.0

    /** 2.0 */
    static var thickBorderWidth: CGFloat = 2.0

    /** 2.0 */
    static var standardShadowBlur: CGFloat = 2.0

    /** x:0.0 y:2.0 */
    static var standardShadowOffset: CGSize = CGSize(width: 0.0, height: 2.0)
    static var sheetShadowOffset: CGSize = CGSize(width: 0.0, height: -2.0)
    init() {}
}
