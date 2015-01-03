//
//  SA01OnePixLineViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 14/12/18.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit

class SA01OnePixLineViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let kMinimumValideCount = 8
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func textFieldDidChanged(sender: AnyObject)
    {
        self.resultLabel.text = "解析结果是：\(self.textField.text)"
    }

    func cookString(original: String) -> String
    {
        if original.utf16Count < self.kMinimumValideCount {
            return original
        }

        var i = 0, atIndex = -1, leftParenthesis = -1, rightParenthesisIndex = -1
        for character in original {
            if atIndex == -1 {
                atIndex = character == "@" ? i : -1
                continue
            }
            if leftParenthesis == -1 {
                leftParenthesis = character == "(" ? i : -1
                continue
            }
            if rightParenthesisIndex == -1 {
                if character == ")" {
                    println("找到一个：--\(atIndex)--\(leftParenthesis)--\(rightParenthesisIndex)")
                }
            }
        }
//        var i = 0, startName = -1, endName = -1
//        var getName = false
//        var getUserID = false
//        for character in original {
//            if startName == -1 {
//                startName = character == "@" ? i : -1
//                endName = startName
//            } else {
//                if !getName {
//                    if character != "(" {
//                        endName = endName + 1
//                    } else {
//                        getName = true
//                    }
//                } else {
//                }
//            }
//        }
        return original
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
