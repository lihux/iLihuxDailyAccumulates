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
        print("出事前：\(s)")
        let b = s.replacingOccurrences(of: "\\n", with: "\n")
        print("出事后：\(b)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("***************************")
        print("\(self.textView.layoutMargins.left) \(self.textView.layoutMargins.top)")
        print("***************************")
        print(self.textView.layoutManager)
        print("***************************")
        print(self.textView.textContainer)
        print("***************************")
        print(self.textView.textContainerInset)
        print("\(self.textView.textContainerInset.left) \(self.textView.textContainerInset.top)")
    }
    func test()
    {
        var paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 17
//        var dog :DictionaryLiteral = 
        
//        var dic = NSDictionary(dictionaryLiteral:UIFont(name: "STHeitiSC-Medium", size: 14)!, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName)
//        var dic = NSDictionary(objects: [UIFont(name: "STHeitiSC-Medium", size: 14)!], forKeys: [NSFontAttributeName])
        var dic:[String: Any] = [NSFontAttributeName: UIFont(name: "STHeitiSC-Medium", size: 14)!]
        var string = "聚合徐小平、牛文文、吴声、孟醒（雕爷）、蔡明等资本、营销、电商三大领域的顶级专家现场坐台，深精百战，弹无虚发。\n"
        var attributeString1 = NSMutableAttributedString(string: string, attributes: dic)
        
        var attributeString2 = NSMutableAttributedString(string: string, attributes: dic)
//        attributeString1.appendAttributedString(attributeString2)
        
        paragraphStyle.lineSpacing = 5
        dic = [NSFontAttributeName: UIFont(name: "STHeitiSC-Medium", size: 14)!, NSParagraphStyleAttributeName: paragraphStyle]
//        dic = NSDictionary(objectsAndKeys:UIFont(name: "STHeitiSC-Medium", size: 14)!, NSFontAttributeName, paragraphStyle, NSParagraphStyleAttributeName)
        var attributeString3 = NSMutableAttributedString(string: string, attributes: dic as! [String : AnyObject])
//        attributeString1.appendAttributedString(attributeString3)
        self.textView.attributedText = attributeString1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

