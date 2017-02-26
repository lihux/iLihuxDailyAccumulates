//
//  GZLRViewControllerExtension.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/25.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import Foundation

extension GZLRViewController {

    func saveCurrentConstraintsStates()
    {
        for constraint in self.topViewsTopConstraints {
            self.topViewsTopConstraintConstants.append(constraint.constant)
        }

        for constraint in self.midViewsTopConstraints {
            self.midViewsTopConstraintConstants.append(constraint.constant)
        }

        for constraint in self.bottomViewsBottomConstraints {
            self.bottomViewsBottomConstraintConstants.append(constraint.constant)
            constraint.constant = -self.switchLoginButton.bounds.size.height
        }
    }

    func prepareViewsForAnimatingShow()
    {
        let transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        for view in self.midViews {
            view.transform = transform
            view.alpha = 0
        }
        for constraint in self.midViewsTopConstraints {
            constraint.constant += self.kConstraintConstantOffsetForHiden
        }
        self.topViews[1].transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        self.view.layoutIfNeeded()
    }

    func animatingLoadAllViews()
    {
        self.bounceOutSlogonView()
        self.bounceUpBottomView()
    }

    func bounceOutSlogonView()
    {
        UIView.animate(withDuration: self.animationDuratin, animations: { () -> Void in
            for constraint in self.logoSizeConstraints {
                constraint.constant = self.kLogoAfterAnimationWidth
            }
            self.logoViewCenterXConstraint.constant = self.kLogonAfterAnimationCenterXConstraintOffset
            self.topViews[1].transform = CGAffineTransform.identity
            self.topViews[1].alpha = 1
            self.view.layoutIfNeeded()
        })
    }

    func bounceUpBottomView()
    {
        var animationDelay = 0.1
        for i in 0 as Int ..< self.bottomViewsBottomConstraintConstants.count {
            self.animatingConstraint(self.bottomViewsBottomConstraints[i], constant: self.bottomViewsBottomConstraintConstants[i], duration: self.animationDuratin, delay: animationDelay)
            animationDelay = animationDelay + 0.1
        }
    }

    func animatingConstraint(_ constrait: NSLayoutConstraint, constant: CGFloat, duration: TimeInterval, delay:TimeInterval)
    {
        UIView.animate(withDuration: self.animationDuratin, animations: { () -> Void in
            constrait.constant = constant
            self.view.layoutIfNeeded()
        })
    }

    func animatingLoginAndRegisterViews(_ hidding: Bool, isLogin: Bool)
    {
        if !hidding {
            self.titleLabel.text = isLogin ? "友拍账号登录" : "友拍注册"
        }
        self.animatingBlurView(hidding)
        self.animatingTopViews(!hidding)
        self.animatingMidViews(hidding, isLogin: isLogin)
        self.animatingBottomViews(!hidding, isLogin: isLogin)
    }

    func animatingBlurView(_ hiding: Bool)
    {
        var alpha: CGFloat = 1
        var transform = CGAffineTransform(scaleX: self.kTransformScaleMax, y: self.kTransformScaleMax)
        if hiding {
            alpha = 0
            transform = CGAffineTransform.identity
        }

        UIView.animate(withDuration: self.animationDuratin , animations: { () -> Void in
            self.blurContainerView.alpha = alpha
            self.blurContainerView.transform = transform
            self.coverContainerView.transform = transform
            self.view.layoutIfNeeded()
        })
    }

    func animatingTopViews(_ hiding: Bool)
    {
        for constraint in self.topViewsTopConstraints {
            constraint.constant = hiding ? -self.topViews[0].bounds.size.height : self.topViewsTopConstraintConstants[0]
        }
        UIView.animate(withDuration: self.animationDuratin, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }

    func animatingBottomViews(_ hiding: Bool, isLogin: Bool)
    {
        UIView.animate(withDuration: self.animationDuratin, animations: { () -> Void in
            if isLogin {
                self.bottomViewsTopConstraints[0].constant = hiding ? self.bottomViewsTopConstraintConstants[0] : 1000
                self.changeBottomView(1, hiding: hiding)
            } else {
                self.bottomViewsTopConstraints[1].constant = hiding ? self.bottomViewsTopConstraintConstants[1] : 1000
                self.switchRegisterButton.setTitle((hiding ? "下一步" : "注册"), for: UIControlState())
                self.changeBottomView(0, hiding: hiding)
            }
            self.changeBottomView(2, hiding: hiding)
            self.changeBottomView(3, hiding: hiding)
            self.view.layoutIfNeeded()
        })
    }

    func changeBottomView(_ index: Int, hiding: Bool)
    {
        let constantOffset: CGFloat = hiding ? kConstraintConstantOffsetForHiden : 0
        self.bottomViewsBottomConstraints[index].constant = self.bottomViewsBottomConstraintConstants[index] + constantOffset
        self.bottomViews[index].alpha = hiding ? 0 : 1
        self.bottomViews[index].transform = hiding ? CGAffineTransform(scaleX: 0.1, y: 0.1) : CGAffineTransform.identity
    }

    func animatingMidViews(_ hiding: Bool, isLogin: Bool)
    {
        if isLogin {
            UIView.animate(withDuration: self.animationDuratin, animations: { () -> Void in
                for i in 0 ..< 4 {
                    self.changeMidView(i, hiding: hiding)
                }
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: self.animationDuratin, animations: { () -> Void in
                self.changeMidView(0, hiding: hiding)
                self.changeMidView(4, hiding: hiding)
                self.view.layoutIfNeeded()
            })
        }
    }

    func changeMidView(_ index: Int, hiding: Bool)
    {
        let constantOffset: CGFloat = hiding ? kConstraintConstantOffsetForHiden : 0
        self.midViewsTopConstraints[index].constant = self.midViewsTopConstraintConstants[index] + constantOffset
        self.midViews[index].alpha = hiding ? 0 : 1
        self.midViews[index].transform = hiding ? CGAffineTransform(scaleX: 0.1, y: 0.1) : CGAffineTransform.identity
    }

}
