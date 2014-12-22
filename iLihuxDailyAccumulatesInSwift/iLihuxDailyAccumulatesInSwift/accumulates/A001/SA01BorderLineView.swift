//
//  SA01BorderLineView.swift
//  Guozhao
//
//  Created by lihux on 14/12/19.
//  Copyright (c) 2014年 Renren co. All rights reserved.
//

import UIKit

@IBDesignable class SA01BorderLineView: UIView {

    @IBInspectable var isHorizontal: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()
        let layoutAttribute = self.isHorizontal ? NSLayoutAttribute.Height : NSLayoutAttribute.Width
        for item in self.constraints() {
            let constraint = item as NSLayoutConstraint
            if constraint.firstItem as UIView == self && constraint.firstAttribute == layoutAttribute {
                self.removeConstraint(constraint)
                constraint.constant = UIScreen.mainScreen().scale == 2 ? 0.5 : 1
                self.addConstraint(constraint)
            }
        }
    }

}
