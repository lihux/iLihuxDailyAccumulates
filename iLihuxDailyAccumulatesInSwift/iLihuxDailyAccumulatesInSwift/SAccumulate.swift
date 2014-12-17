//
//  SAccumulate.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 14/12/17.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit

class SAccumulate: NSObject {
    let title: String
    let content: String
    let storyboardID: String

    init(title: String, content: String, storyboardID: String)
    {
        self.title = title
        self.content = content
        self.storyboardID = storyboardID
        super.init()
    }
}
