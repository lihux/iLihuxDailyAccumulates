//
//  SA05PhotoImageView.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

@IBDesignable class SA05PhotoImageView: UIImageView {

    required init(coder aDecoder: NSCoder) {
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
        self.addObserver(self, forKeyPath: "image", options: NSKeyValueObservingOptions.New, context: nil)
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [NSObject : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "image" {
            if let image = change![NSKeyValueChangeNewKey] as? UIImage {
                print("我靠，进来了")
                image.resizableImageWithCapInsets(UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10))
            }
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "image")
    }
}
