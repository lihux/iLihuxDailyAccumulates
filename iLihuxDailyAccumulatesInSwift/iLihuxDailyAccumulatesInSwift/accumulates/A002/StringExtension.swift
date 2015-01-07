//
//  StringExtension.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 15/1/3.
//  Copyright (c) 2015年 lihux. All rights reserved.
//

import UIKit

//Mark: String Extensions (about Unicode)
//http://xiaomacooperation.blog.163.com/blog/static/120260795201381812161/
//阿拉伯数字：48~57, 英文：0~127, 中文Unicode编码范围：0x4e00~0x9fa5
//println("字符：'\(self)是：\(codeUnit.value)'") // for debug

extension String {
    func stringIsArabicNumberals() -> Bool {
        for codeUnit in self.unicodeScalars {
            if codeUnit.value < 48 || codeUnit.value > 57 {
                return false
            }
        }
        return true
    }
    
    func stringIsAlphabet() -> Bool
    {
        for codeUnit in self.unicodeScalars {
            if codeUnit.value >= 65 && codeUnit.value <= 90 ||  codeUnit.value >= 97 && codeUnit.value <= 122{
                continue
            }
            return false
        }
        return true
    }
    
    func stringIsASCII() -> Bool
    {
        for codeUnit in self.unicodeScalars {
            if codeUnit.value > 127 {
                return false
            }
        }
        return true
    }
    
    func stringIsChineseCharacters() ->Bool {
        for codeUnit in self.unicodeScalars {
            if codeUnit.value >= 10123 && codeUnit.value <= 10130 {
                continue
            } else if codeUnit.value < 0x4e00 || codeUnit.value > 0x9fa5 {
                return false
            }
        }
        return true
    }

    func printUnicode()
    {
        for unicode in self.unicodeScalars {
            println(unicode.value)
        }
    }
}
