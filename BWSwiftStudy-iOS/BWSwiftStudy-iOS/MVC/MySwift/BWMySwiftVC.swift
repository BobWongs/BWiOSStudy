//
//  BWMySwift.swift
//  BWSwiftStudy-iOS
//
//  Created by BobWong on 16/11/16.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import UIKit

class BWMySwiftVC: BWBaseVC, UITextFieldDelegate, BWMySwiftDelegate {
    
    var label: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MySwift"
        
        self.setUI()
    }
    
    func setUI() {
        label = UILabel.init(frame: CGRectMake(20, 64 + 20, 200, 35))
        label?.text = "This is a label!"
        label?.textAlignment = .Center
        label?.backgroundColor = UIColor.greenColor()
        label?.sizeToFit()
        self.view.addSubview(label!)
        
        let textField = UITextField.init(frame: CGRectMake(20, CGRectGetMaxY(label!.frame) + 20, 200, 44))
        textField.placeholder = "Please Input Something"
        textField.delegate = self
        self.view.addSubview(textField)
        
        let imageView = UIImageView.init(frame: CGRectMake(20, CGRectGetMaxY(textField.frame) + 20, 100, 100))
        imageView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(imageView)
        
        let textView = UITextView.init(frame: CGRectMake(20, CGRectGetMaxY(imageView.frame) + 20, 200, 50))
        textView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(textView)
        
        let button = UIButton.init(type: .Custom)
        button.frame = CGRectMake(20, CGRectGetMaxY(textView.frame), 200, 44)
        button.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
        button.setTitle("Button", forState: .Normal)
        button.addTarget(self, action: #selector(buttonAct), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    // MARK: UITextField Delegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    // MARK: Action
    func buttonAct(sender: UIButton) {
        print("button action, button's title is %@", sender.titleLabel?.text)
        
        let vcNext = BWMySwiftNextVC.init()
        vcNext.delegate = self
        self.navigationController?.pushViewController(vcNext, animated: true)
    }
    
    // MARK: MySwift Delegate
    func mySwiftDelegateSetLabelText(text: String) {
        label?.text = text
        label?.sizeToFit()
    }
}
