//
//  BWExtension.swift
//  BWSwiftStudy-MacOS
//
//  Created by BobWong on 16/8/30.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import Foundation

func swift_extension() {
    let str = "abcdefghijk"
    print("\(str)'s first letter is \(str.firstLetter())")
}

extension String {
    func firstLetter() -> String {
        return (self as NSString).substringWithRange(NSMakeRange(0, 1))
    }
}