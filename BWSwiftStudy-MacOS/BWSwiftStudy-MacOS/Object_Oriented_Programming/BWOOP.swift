//
//  BWOOP.swift
//  BWSwiftStudy-MacOS
//
//  Created by BobWong on 16/8/30.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import Foundation

func bw_oop() {
    let computer = Computer(id: 100001, name: "macbook", weight: 33.3)
    computer.weight = 55.5
    
//    print(computer.description())
//    print(computer.calculate())
//    
//    let laptop = Laptop()
//    print(laptop.calculate())
    
//    print(computer.name)
    
    computer.setName("Macbook Pro")
    print(computer.getName())
}

// MARK: 类的定义、继承、遵循协议

class Computer: Network {
    var id: Int = 0
    var name: String?
    var weight: Double = 0.0
    
    
    /*------------------
        自定义的类方法
     -----------------*/
    init() {
        id = 100000
        name = "Jenny"
        weight = 30.0
    }
    
    init(id: Int, name: String, weight: Double) {
        self.id = id
        self.name = name
        self.weight = weight
    }
    
    func description() -> String {
        return "the computer is id: \(id), name: \(name), weight: \(weight)"
    }
    
    func calculate() {
        print("computer can calculate")
    }
    
    /*------------------
        Getter和Setter方法，待继续研究
     -----------------*/
    func getName() -> String {
        return "name is \(name)"
    }
    func setName(name: String) {
        self.name = name
    }
    
    
    /*------------------
        协议方法
     -----------------*/
    var networkName: String = "Network Name"
    func networkCommunicate(sendMsg: String, receiveMsg: String) {
        print("sendMsg: \(sendMsg), receiveMsg: \(receiveMsg)")
    }
}

/*------------------
    第一个为继承的父类，接下来的是Protocol
 -----------------*/
class Laptop: Computer, Local_Network {
    override func calculate() {
        super.calculate()
        print("Laptop calculate")
    }
    
    func modifyId() {
        id = 111111
    }
    
    func connect() {
        print("connect")
    }
}

protocol Network {
    var networkName: String { get set }
    func networkCommunicate(sendMsg: String, receiveMsg: String)
}

protocol Local_Network: Network {
    func connect()
}
