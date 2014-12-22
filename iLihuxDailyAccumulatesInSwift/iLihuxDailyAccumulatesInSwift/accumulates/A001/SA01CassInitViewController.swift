//
//  SA01CassInitViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 14/12/18.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit

class SA01CassInitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let lineview = UIView(frame: CGRectMake(40, 310, 200, 0.5))
        lineview.backgroundColor = UIColor.redColor()
        self.view.addSubview(lineview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
