//
//  SA05LayerAnimationViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA05LayerAnimationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style:UIBlurEffectStyle.Dark))
        blurEffectView.frame = self.imageView.bounds
        self.imageView.addSubview(blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
