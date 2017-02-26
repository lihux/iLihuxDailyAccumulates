//
//  SA05PhotoImageView.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

@IBDesignable class SA05PhotoImageView: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addObserverForImageChange()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addObserverForImageChange()
    }

    override init(image: UIImage?) {
        super.init(image: image)
        self.addObserverForImageChange()
    }

    func addObserverForImageChange() {
        self.addObserver(self, forKeyPath: "image", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "image" {
            if let image = change![NSKeyValueChangeKey.newKey] as? UIImage {
                print("我勒个去，进来了")
                image.resizableImage(withCapInsets:UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10))
            }
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "image")
    }
}
