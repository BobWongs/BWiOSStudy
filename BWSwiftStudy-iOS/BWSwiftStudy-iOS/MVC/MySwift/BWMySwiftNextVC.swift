//
//  BWMySwiftNextVC.swift
//  BWSwiftStudy-iOS
//
//  Created by BobWong on 16/11/16.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import UIKit

class BWMySwiftNextVC: BWBaseVC {
    
    weak var delegate: BWMySwiftDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MySwiftNext"
        
        let item = UIBarButtonItem.init(title: "Delegate", style: .Plain, target: self, action: #selector(barButtonItemAct))
        self.navigationItem.rightBarButtonItem = item
    }
    
    func barButtonItemAct() {
        delegate?.mySwiftDelegateSetLabelText("My Delegate Text")
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}

// 声明一个协议, 让其扩展NSObjectProtocol, 只有这样才能在设置代理的时候前面添加weak
protocol BWMySwiftDelegate: NSObjectProtocol {
    func mySwiftDelegateSetLabelText(text: String)
}