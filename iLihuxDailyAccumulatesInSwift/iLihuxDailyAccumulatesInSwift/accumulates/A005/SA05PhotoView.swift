//
//  SA05PhotoView.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA05PhotoView: UIView {

    var imageView = UIImageView()
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.adjustImageViewFrame()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.adjustImageViewFrame()
    }

    func adjustImageViewFrame()
    {
        self.addSubview(self.imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-10-[imageView]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView": self.imageView]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[imageView]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["imageView": self.imageView]))
        self.layoutIfNeeded()
    }
}
