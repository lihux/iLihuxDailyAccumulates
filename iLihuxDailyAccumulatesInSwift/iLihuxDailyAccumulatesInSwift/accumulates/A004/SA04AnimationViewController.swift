//
//  SA04AnimationViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA04AnimationViewController: UIViewController {

    @IBOutlet weak var leve1BottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var leve2BottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var leve3BottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var leve4BottomConstraint: NSLayoutConstraint!

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var titleView: UIView!

    var bottomConstraintConstants = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadConstraintConstants()
        self.shiftViewsForBouncingUp()
    }

    func loadConstraintConstants()
    {
        self.bottomConstraintConstants = [self.leve1BottomConstraint.constant,
                                          self.leve2BottomConstraint.constant,
                                          self.leve3BottomConstraint.constant,
                                          self.leve4BottomConstraint.constant]
    }

    func shiftViewsForBouncingUp()
    {
        self.leve1BottomConstraint.constant = -44
        self.leve2BottomConstraint.constant = -44
        self.leve3BottomConstraint.constant = -44
        self.leve4BottomConstraint.constant = -44
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.bouncingUpViews()
    }

    func bouncingUpViews()
    {
        let kAnimationDuration = 1.35
        let kAnimationDelay = 0.1
        self.animatingConstraint(self.leve4BottomConstraint, constant: self.bottomConstraintConstants[3], duration: kAnimationDuration, delay: 0.1)
        self.animatingConstraint(self.leve3BottomConstraint, constant: self.bottomConstraintConstants[2], duration: kAnimationDuration, delay: 0.2)
        self.animatingConstraint(self.leve2BottomConstraint, constant: self.bottomConstraintConstants[1], duration: kAnimationDuration, delay: 0.3)
        self.animatingConstraint(self.leve1BottomConstraint, constant: self.bottomConstraintConstants[0], duration: kAnimationDuration, delay: 0.4)
    }

    func animatingConstraint(constrait: NSLayoutConstraint, constant: CGFloat, duration: NSTimeInterval, delay:NSTimeInterval)
    {
        constrait.constant = constant
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
