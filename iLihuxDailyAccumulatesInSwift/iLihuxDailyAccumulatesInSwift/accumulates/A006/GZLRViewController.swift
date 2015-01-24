//
//http://qa.d.xiaonei.com/jira/browse/PBI-1066
//  GZLRViewController.swift
//  Guozhao
//
//  Created by lihux on 15/1/23.
//  Copyright (c) 2015年 Renren co. All rights reserved.
//

import UIKit

class GZLRViewController: UIViewController {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancerButton: UIButton!
    @IBOutlet weak var coverContainerView: SA04View!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var blurContainerView: SA04View!
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var switchLoginButton: UIButton!
    @IBOutlet weak var switchRegisterButton: UIButton!

    @IBOutlet var logoSizeConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var logoViewCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var topViewsTopConstraints: [NSLayoutConstraint]!
    var topViewsTopConstraintConstants = [CGFloat]()
    //topViews = [logo、slogon]
    @IBOutlet var topViews: [SA04View]!
    @IBOutlet var bottomViewsTopConstraints: [NSLayoutConstraint]!
    var bottomViewsTopConstraintConstants: [CGFloat] = [200, 120]
    @IBOutlet var bottomViewsBottomConstraints: [NSLayoutConstraint]!
    var bottomViewsBottomConstraintConstants = [CGFloat]()
    //bottomViews = [登录按钮、注册按钮、间隔线、第三方分享]
    @IBOutlet var bottomViews: [SA04View]!
    @IBOutlet var midViewsTopConstraints: [NSLayoutConstraint]!
    var midViewsTopConstraintConstants = [CGFloat]()
    //midViews = [标题，登录手机输入、登录密码输入、忘记密码、注册手机输入]
    @IBOutlet var midViews: [SA04View]!

    var animationDuratin: Double {
        get {
            return Double(sliderValues[4])
        }
    }
    let kLogoAfterAnimationWidth: CGFloat = 80
    let kConstraintConstantOffsetForHiden: CGFloat = 120
    let kSlogonBeforeAnimationCompressionRatio: CGFloat = 0.8
    let kLogonAfterAnimationCenterXConstraintOffset: CGFloat = 63
    let kTransformScaleMax: CGFloat = 1.6
    var slogonViewSizeConstants = [CGFloat]()

    var hasAnimatedShowBottomViews = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customUI()
        self.saveCurrentConstraintsStates()
        self.prepareViewsForAnimatingShow()
    }

    func customUI()
    {
        self.switchRegisterButton.layer.borderWidth = 1
        self.switchRegisterButton.layer.borderColor = UIColor.whiteColor().CGColor
        let blurImage = self.coverImageView.image!.applyBlurWithRadius(18, tintColor: UIColor.clearColor(), saturationDeltaFactor: 1, maskImage: nil)
        self.blurImageView.image = blurImage
        self.blurContainerView.alpha = 0
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !self.hasAnimatedShowBottomViews {
            self.hasAnimatedShowBottomViews = true
            self.animatingLoadAllViews()
        }
    }

    @IBAction func didTapOnBlurView(sender: AnyObject)
    {
    }

    @IBAction func didTapOnLoginButton(sender: UIButton)
    {
        if sender.tag == 0 {
            self.cancerButton.tag = 0
            self.animatingLoginAndRegisterViews(false, isLogin: true)
        }
    }

    @IBAction func didTapOnRegisterButton(sender: UIButton)
    {
        if sender.tag == 0 {
            self.cancerButton.tag = 1
            self.animatingLoginAndRegisterViews(false, isLogin: false)
        }
    }

    @IBAction func didTapOnCancelButton(sender: AnyObject)
    {
        self.animatingLoginAndRegisterViews(true, isLogin: (sender.tag == 0 ? true : false))
    }
    
    @IBAction func didTapOnBackButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
