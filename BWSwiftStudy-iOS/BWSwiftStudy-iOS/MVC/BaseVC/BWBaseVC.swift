//
//  BWBaseVC.swift
//  BWSwiftStudy-iOS
//
//  Created by BobWong on 16/11/15.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import UIKit

class BWBaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    deinit {
        print("\(NSStringFromClass(self.dynamicType)) has been dealloc")
    }
    
}