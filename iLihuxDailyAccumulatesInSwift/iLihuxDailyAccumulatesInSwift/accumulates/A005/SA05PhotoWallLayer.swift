//
//  SA05PhotoWallLayer.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/22.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA05PhotoWallLayer: CALayer {
    
    override func addSublayer(layer: CALayer) {
        layer.position = self.randomPosition()
        super.addSublayer(layer)
    }

    func randomPosition() -> CGPoint
    {
        return CGPointZero
    }
   
}
