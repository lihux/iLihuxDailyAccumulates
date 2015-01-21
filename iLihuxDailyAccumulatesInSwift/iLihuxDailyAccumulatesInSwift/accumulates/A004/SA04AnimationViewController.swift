//
//  SA04AnimationViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA04AnimationViewController: UIViewController {

    @IBOutlet weak var backScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Float(2) * Float(NSEC_PER_SEC) )), dispatch_get_main_queue()) { () -> Void in
//            UIView.animateWithDuration(50, delay: 0, options: UIViewAnimationOptions.allZeros, animations: { () -> Void in
//                self.backScrollView.scrollRectToVisible(CGRectMake(800, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), animated: false)
//            }, completion: nil)
            UIView.animateWithDuration(50, delay: 0, usingSpringWithDamping: 30, initialSpringVelocity: 0, options: UIViewAnimationOptions.allZeros, animations: { () -> Void in
                self.backScrollView.scrollRectToVisible(CGRectMake(800, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), animated: false)

            }, completion: nil)
//            UIView.animateWithDuration(50, animations: { () -> Void in
//            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
