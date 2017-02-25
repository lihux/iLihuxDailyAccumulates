//
//  GZBorderLineView.swift
//  Guozhao
//
//  Created by lihux on 14/12/19.
//  Copyright (c) 2014年 Renren co. All rights reserved.
//

import UIKit

@IBDesignable class GZBorderLineView: UIView {

    @IBInspectable var isHorizontal: Bool = true

    override func layoutSubviews()
    {
        super.layoutSubviews()
        let layoutAttribute = self.isHorizontal ? NSLayoutAttribute.height : NSLayoutAttribute.width
        for item in self.constraints {
            let constraint = item as NSLayoutConstraint
            if constraint.firstItem as! UIView == self && constraint.firstAttribute == layoutAttribute && constraint.secondItem == nil {
                self.removeConstraint(constraint)
                constraint.constant = 1 / UIScreen.main.scale
                self.addConstraint(constraint)
            }
        }
    }

}
