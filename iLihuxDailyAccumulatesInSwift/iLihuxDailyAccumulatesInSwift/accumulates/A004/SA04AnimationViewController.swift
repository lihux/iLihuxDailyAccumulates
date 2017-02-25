//
//  SA04AnimationViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/15.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

var sliderValues: [Float] = [0.1, 0.3, 0.5, 0.2, 0.6]

class SA04AnimationViewController: UIViewController {

    @IBOutlet var bottomConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var blueViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var blueView2LeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var bezierDisplayView: UIView!

    @IBOutlet var valueLabels: [UILabel]!
    
    let bezierCurveShapeLayer = CAShapeLayer()
    let bezierLineShapeLayer = CAShapeLayer()

    @IBOutlet var sliders: [UISlider]!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var blueView2: SA04View!

    var bottomConstraintConstants = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customUI()
        self.shiftViewsForBouncingUp()
    }

    func customUI()
    {
        self.customBezierCurveShapeLayer()
        self.customBezierLineShapeLayer()
        self.updateSliderValues()
    }

    func customBezierCurveShapeLayer()
    {
        self.bezierCurveShapeLayer.bounds = self.bezierDisplayView.bounds
        self.bezierCurveShapeLayer.path = self.bezierPath(true).cgPath
        self.bezierCurveShapeLayer.frame = self.bezierDisplayView.bounds
        self.bezierCurveShapeLayer.strokeColor = UIColor.white.cgColor
        self.bezierCurveShapeLayer.fillColor = UIColor.clear.cgColor
        self.bezierCurveShapeLayer.lineWidth = 2
        self.bezierDisplayView.layer.addSublayer(self.bezierCurveShapeLayer)
    }
    func customBezierLineShapeLayer()
    {
        self.bezierLineShapeLayer.bounds = self.bezierDisplayView.bounds
        self.bezierLineShapeLayer.path = self.bezierPath(false).cgPath
        self.bezierLineShapeLayer.frame = self.bezierDisplayView.bounds
        self.bezierLineShapeLayer.strokeColor = UIColor.green.cgColor
        self.bezierLineShapeLayer.fillColor = UIColor.clear.cgColor
        self.bezierLineShapeLayer.lineWidth = 1
        self.bezierLineShapeLayer.lineDashPattern = [2, 2]
        self.bezierDisplayView.layer.addSublayer(self.bezierLineShapeLayer)
    }

    func bezierPath(_ isCurve: Bool) -> UIBezierPath
    {
        let size = self.bezierDisplayView.bounds.size
        let p0x: CGFloat = 0, p0y: CGFloat = size.height
        let p1x = size.width * CGFloat(self.sliders[0].value)
        let p1y = size.height * (1 - CGFloat(self.sliders[1].value))
        let p2x = size.width * CGFloat(self.sliders[2].value)
        let p2y = size.height * (1 - CGFloat(self.sliders[3].value))
        let p3x: CGFloat = size.width, p3y: CGFloat = size.height
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: p0x, y: p0y))
        if isCurve {
            bezierPath.move(to: CGPoint(x: p0x, y: p0y))
            bezierPath.addCurve(to: CGPoint(x: p3x, y: p3y), controlPoint1: CGPoint(x: p1x, y: p1y), controlPoint2: CGPoint(x: p2x, y: p2y))
        } else {
            let yOffset: CGFloat = 2
            bezierPath.move(to: CGPoint(x: p0x, y: p0y - yOffset))
            bezierPath.addLine(to: CGPoint(x: p1x, y: p1y - yOffset))
            bezierPath.addLine(to: CGPoint(x: p2x, y: p2y - yOffset))
            bezierPath.addLine(to: CGPoint(x: p3x, y: p3y - yOffset))
        }
        return bezierPath
    }

    func shiftViewsForBouncingUp()
    {
        for constraint in self.bottomConstraints {
            self.bottomConstraintConstants.append(constraint.constant)
            constraint.constant = -44
        }
    }

    @IBAction func sliderValueDidChanged(_ sender: AnyObject) {
        self.updateSliderValues()
        self.bezierLineShapeLayer.path = self.bezierPath(false).cgPath
        self.bezierCurveShapeLayer.path = self.bezierPath(true).cgPath
        self.bezierDisplayView.layer.setNeedsDisplay()
    }

    @IBAction func didTapOnLoginButton(_ sender: UIButton)
    {
        self.updateSliderValues()
        let isStageOne = sender.tag == 0
        let constant: CGFloat = isStageOne ? 200 : 10
        self.blueViewLeftConstraint.constant = constant
        self.blueView2LeftConstraint.constant = constant
        sender.isEnabled = false
        sender.tag = isStageOne ? 1 : 0
        UIView.animate(withDuration: Double(sliderValues[4]), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }, completion: { (stop) -> Void in
                sender.isEnabled = true
        })
    }

    func updateSliderValues()
    {
        for i in 0 ..< sliderValues.count {
            sliderValues[i] = self.sliders[i].value
            self.valueLabels[i].text = String(format: "%.4f", self.sliders[i].value)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.bouncingUpViews()
    }

    func bouncingUpViews()
    {
        let kAnimationDuration = 1.35
        var animationDelay = 0.1
        for (i in 0 as Int ..< self.bottomConstraints.count) {
            self.test(self.bottomConstraints[3 - i], constant: self.bottomConstraintConstants[3 - i], duration: kAnimationDuration, delay: animationDelay)
            animationDelay = animationDelay + 0.1
        }
    }

    func test(_ constrait: NSLayoutConstraint, constant: CGFloat, duration: TimeInterval, delay:TimeInterval)
    {
        constrait.constant = constant
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }) { (stop) -> Void in
            return
        }
    }

    func animatingConstraint(_ constrait: NSLayoutConstraint, constant: CGFloat, duration: TimeInterval, delay:TimeInterval)
    {
        constrait.constant = constant
        if delay == 0.1 {
            var frame = self.titleView.frame
            frame.size.height += 30
            self.titleView.frame = frame
        }
        UIView.animate(withDuration: 0.6, delay: delay, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.1, options: UIViewAnimationOptions(), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (stop) -> Void in
                return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
