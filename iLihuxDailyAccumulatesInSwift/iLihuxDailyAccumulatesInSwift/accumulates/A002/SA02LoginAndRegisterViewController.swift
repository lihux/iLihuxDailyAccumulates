//
//  SA02LoginAndRegisterViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/3.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

class SA02LoginAndRegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logTextView: UITextView!

    let userNameInfo = ["用户名必须是中文英文和数字", "用户名不能是纯数字", "用户名不少于4个字母（两个中文）", "用户名不超过14个字母（7个中文）"]
    let passwordInfo = ["密码只支持英文、符号和数字", "密码必须在6到20字符之间"]
    let kUserNameMaxCount = 14
    let kUserNameMinCount = 4
    let kPasswordMaxCount = 20
    let kPasswordMinCount = 6
    var lastValidUserName = ""
    var hasUserNameChecked = false
    var hasPasswordChecked = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func editingDidChanged(sender: AnyObject)
    {
        self.updateInfoLabel(sender)
        let textField = sender as! UITextField
        let text = textField.text!
        text.printUnicode()

        if textField.markedTextRange == nil {
            if textField == self.userNameTextField {
                if text != self.lastValidUserName && !self.hasUserNameChecked {
                    self.hasUserNameChecked = false
                    if !self.stringIsValidUserName(text) {
                        textField.text = self.lastValidUserName
                        self.alertLabel.text = "\(self.userNameInfo[0]) change"
                    } else {
                        if self.userNameStringCount(text) > self.kUserNameMaxCount {
                            textField.text = self.lastValidUserName
                            self.alertLabel.text = self.userNameInfo[3]
                        } else {
                            self.lastValidUserName = text
                        }
                    }
                }
            } else {
            }
        }
    }

    func updateInfoLabel(sender: AnyObject)
    {
        if sender as! NSObject == self.userNameTextField {
            self.infoLabel.text = "\(self.userNameInfo[0])\n\(self.userNameInfo[1])\n\(self.userNameInfo[2])\n\(self.userNameInfo[3])"
        } else {
            self.infoLabel.text = "\(self.passwordInfo[0])\n\(self.passwordInfo[1])"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func stringIsValidUserName(string: String) -> Bool
    {
        return string.stringIsAlphabet() || string.stringIsArabicNumberals() || string.stringIsChineseCharacters()
    }

    func stringIsValidPassword(string: String) -> Bool
    {
        return string.stringIsASCII()
    }

    //统计用户名字符数，规则是：中文占2字符、英文1字符
    func userNameStringCount(string: String) -> Int
    {
        return 0;
//        return (countElements(string.utf8) + string.utf16Count) / 2
    }

    //program mark - UITextFieldDelegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("标记：\(textField.markedTextRange)")
        self.hasUserNameChecked = false
        if string == "" {
            self.hasUserNameChecked = true
            return true
        }

        let text = textField.text!
        if textField.markedTextRange == nil {
            if textField == self.userNameTextField {
                self.hasUserNameChecked = true
                if !self.stringIsValidUserName(string) {
                    self.alertLabel.text = "\(self.userNameInfo[0])30"
                    return false
                } else {
                    if self.userNameStringCount(text) + self.userNameStringCount(string) > self.kUserNameMaxCount {
                        self.alertLabel.text = self.userNameInfo[3]
                        return false
                    }
                }
            } else {
                self.hasPasswordChecked = true
                if !self.stringIsValidPassword(string) {
                    self.alertLabel.text = self.passwordInfo[0]
                    return false
                }
            }
        }
        self.alertLabel.text = ""
        return true
    }

}
