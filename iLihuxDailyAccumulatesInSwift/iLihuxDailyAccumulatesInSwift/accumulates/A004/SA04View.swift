//
//  SA04View.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/23.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA04View: UIView {

    override class func layerClass() -> AnyClass {
        return SA04Layer.self
    }

    override func actionForLayer(layer: CALayer!, forKey event: String!) -> CAAction! {
        let action = super.actionForLayer(layer, forKey: event)
        println("\n面SA04View：\nactionForLayer(layer: \(layer), forKey event: \(event)) -> \(action)\n")
        return action
    }
}
