//
//  ViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 14/12/9.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit

class god {
    var dog: Int?
}

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.testString()
    }

    func testString()
    {
        let s:NSString = "假如给我三天光明\n我将要用它来寻找希望\\n加入给我十年，我就会用它来颓废\\\n多么讽刺的事实啊！"
        println("出事前：\(s)")
        let b = s.stringByReplacingOccurrencesOfString("\\n", withString: "\n")
        println("出事后：\(b)")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("***************************")
        println("\(self.textView.layoutMargins.left) \(self.textView.layoutMargins.top)")
        println("***************************")
        println(self.textView.layoutManager)
        println("***************************")
        println(self.textView.textContainer)
        println("***************************")
        println(self.textView.textContainerInset)
        println("\(self.textView.textContainerInset.left) \(self.textView.textContainerInset.top)")
    }
    func test()
    {
        var paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 17
        var dic = NSDictionary(objectsAndKeys:UIFont(name: "STHeitiSC-Medium", size: 14)!, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName)
        var string = "聚合徐小平、牛文文、吴声、孟醒（雕爷）、蔡明等资本、营销、电商三大领域的顶级专家现场坐台，深精百战，弹无虚发。\n"
        var attributeString1 = NSMutableAttributedString(string: string, attributes: dic)
        
        dic = NSDictionary(objectsAndKeys:UIFont(name: "STHeitiSC-Medium", size: 14)!, NSFontAttributeName)
        var attributeString2 = NSMutableAttributedString(string: string, attributes: dic)
//        attributeString1.appendAttributedString(attributeString2)
        
        paragraphStyle.lineSpacing = 5
        dic = NSDictionary(objectsAndKeys:UIFont(name: "STHeitiSC-Medium", size: 14)!, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName)
        var attributeString3 = NSMutableAttributedString(string: string, attributes: dic)
//        attributeString1.appendAttributedString(attributeString3)
        self.textView.attributedText = attributeString1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

