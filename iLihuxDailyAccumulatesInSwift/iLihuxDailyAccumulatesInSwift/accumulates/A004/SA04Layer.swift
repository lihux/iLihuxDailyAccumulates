//
//  SA04Layer.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/23.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA04Layer: CALayer {

    override func addAnimation(anim: CAAnimation!, forKey key: String!) {
        var timeFunctionControlPoints: [Float] = [0.1, 0.3, 0.5, 0.2]
        for var i = 0; i < sliderValues.count; i++ {
            timeFunctionControlPoints[i] = sliderValues[i]
        }
        println("\n层SA04Layer中：addAnimation(anim: \(anim), forKey key: \(key))\n")
        if var animation = anim as? CABasicAnimation {
            animation.timingFunction = CAMediaTimingFunction(controlPoints: timeFunctionControlPoints[0], timeFunctionControlPoints[1], timeFunctionControlPoints[2], timeFunctionControlPoints[3])
            super.addAnimation(animation, forKey: key)
        } else {
            super.addAnimation(anim, forKey: key)
        }
    }

    override func actionForKey(event: String!) -> CAAction! {
        println("\n层SA04Layer中actionForKey开始调用\n")
        let action = super.actionForKey(event)
        println("\n层SA04Layer中：actionForKey(event: \(event)-> CAAction \(action))\n")
        return action
    }

    
}
