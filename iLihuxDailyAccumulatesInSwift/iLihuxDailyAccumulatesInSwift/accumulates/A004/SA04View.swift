//
//  SA04View.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/23.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA04View: UIView {

    override class var layerClass : AnyClass {
        return SA04Layer.self
    }

//    override func actionForLayer(_ layer: CALayer, forKey event: String) -> CAAction? {
//        let action = super.actionForLayer(layer, forKey: event)
//        print("\n面SA04View：\nactionForLayer(layer: \(layer), forKey event: \(event)) -> \(action)\n")
//        return nil;
//    }
}
