//
//  SA05LayerAnimationViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA05LayerAnimationViewController: UIViewController {

    @IBOutlet weak var photoView: SA05PhotoView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.customUI()
    }

//    CGSize size = CGSizeMake(self.bounds.size.width,self.bounds.size.height);
//    UIGraphicsBeginImageContext(size);
//    [parentView drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    self.originalImage = image;

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.customUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.customUI()
    }
    func customUI()
    {
        self.photoView.imageView.image = UIImage(named: "weixin")
        UIGraphicsBeginImageContext(self.photoView.bounds.size)
        self.photoView.drawHierarchy(in: self.photoView.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.photoView.imageView.image = image?.applyLightEffect()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
