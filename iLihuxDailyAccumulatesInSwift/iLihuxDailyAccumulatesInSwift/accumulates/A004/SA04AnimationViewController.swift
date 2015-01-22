//
//  SA04AnimationViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA04AnimationViewController: UIViewController {

    @IBOutlet var bottomConstraints: [NSLayoutConstraint]!
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var titleView: UIView!

    var bottomConstraintConstants = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.shiftViewsForBouncingUp()
    }

    func shiftViewsForBouncingUp()
    {
        for constraint in self.bottomConstraints {
            self.bottomConstraintConstants.append(constraint.constant)
            constraint.constant = -44
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.bouncingUpViews()
    }

    func bouncingUpViews()
    {
        let kAnimationDuration = 1.35
        var animationDelay = 0.1
        for (var i = 0 as Int; i < self.bottomConstraints.count; i++) {
            self.animatingConstraint(self.bottomConstraints[3 - i], constant: self.bottomConstraintConstants[3 - i], duration: kAnimationDuration, delay: animationDelay)
            animationDelay = animationDelay + 0.1
        }
    }

    func animatingConstraint(constrait: NSLayoutConstraint, constant: CGFloat, duration: NSTimeInterval, delay:NSTimeInterval)
    {
        constrait.constant = constant
        if delay == 0.1 {
            var frame = self.titleView.frame
            frame.size.height += 30
            self.titleView.frame = frame
        }
        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (stop) -> Void in
                return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
