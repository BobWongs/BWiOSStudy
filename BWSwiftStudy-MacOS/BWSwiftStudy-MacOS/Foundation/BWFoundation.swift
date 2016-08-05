//
//  BWFoundation.swift
//  BWSwiftStudy-MacOS
//
//  Created by BobWong on 16/8/3.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import Foundation

// MARK: Foundation

func swiftFoundation() {
    swiftPrint()
    swiftComment()
    swiftStatement()
    swiftDataType()
}

// MARK: 打印

func swiftPrint() {
    print("the first print style")   // swift打印，优先使用这种打印方式，最新的Swift语言版本中没有println
    NSLog("the second print style")  // 打印有时间、项目名称相关信息，如果需要，则使用这种打印方式
    
    let constant = 10
    var variable = 20
    variable = 30
    
    print("constant is %d", constant)
    print("variable is %d", variable)
}

// MARK: 注释、文档注释

/// This is the function about Comment
///
/// - Note: This is the note
/// - Parameter param0: This is the params0
/// - Returns: void
func swiftComment() {
    //
    /* */
    // MARK: This is the mark!
    // TODO: This is the todo!
    // FIXME: This is the fixme!
}

// MARK: 循环语句、条件语句

func swiftStatement() {
    /*======================
            循环语句
     ======================*/
    for index in 0 ..< 3 {
        print("index is %d", index)
    }
    
    var index1 = 0
    while index1 < 10 {
        print("index1 is %d", index1)
        index1 += 1
    }
    
    var index2 = 10
    do {
        print("index2 is %d", index2)
        index2 += 1;
    }
    
    /*======================
            条件语句
     =======================*/
    let a = 3, b = 2
    
    if a > b {
        print("a > b")
    } else {
        print("a <= b")
    }
    
    a > b ? print("a > b") : print("a <= b")
}

// MARK: 数据类型

func swiftDataType() {
    /*======================
         常量、变量
     =======================*/
    let constant = 66   // 常量
    var variable = 10   // 变量
    variable = 30
    let constant1:Float = 20.0
    
    /*======================
        字符串
     =======================*/
    let string = "this is a string"
    print("%@", string)
    
    let stringA = "stringA"
    let stringB = "stringB"
    let stringEmpty = ""
    
    let stringAB = stringA + stringB
    print("%@", stringAB)
    if stringEmpty.isEmpty {
        print("the string is empty")
    }
    
    /*======================
        数组
     =======================*/
    let array = ["first", "second", "third"]
    for item in array {
        print("item is ", item)
    }
    print("item1 is %@", array[1])
    
    /*======================
        字典
     =======================*/
    let dict = [
        "keyA": "valueA",
        "keyB": "valueB",
        "keyC": "valueC"
    ]
    print("keyA's value is %@", dict["keyA"])
    
}
