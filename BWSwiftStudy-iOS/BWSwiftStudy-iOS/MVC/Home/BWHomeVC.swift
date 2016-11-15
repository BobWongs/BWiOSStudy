//
//  BWHomeVC.swift
//  BWSwiftStudy-iOS
//
//  Created by BobWong on 16/11/15.
//  Copyright © 2016年 BobWong. All rights reserved.
//

import UIKit

class BWHomeVC: BWBaseVC, UITableViewDataSource, UITableViewDelegate {
    
    /*
     UI
     */
    var tableView: UITableView?
    
    /*
     Data
     */
    var dataSource: NSArray?
    
    
    // MARK: Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        dataSource = ["first", "second", "third", "forth", "fifth"];
        
        self.setNavigationBar()
        self.setUI()
    }
    
    // MARK: Action
    
    func buttonActRight() {
        print("Right Button")
    }
    
    // MARK: Private Method
    
    func setNavigationBar() {
        let button = UIButton.init(type: .System)
        button.frame = CGRectMake(0, 0, 50, 35)
        button.setTitle("Right", forState: .Normal)
        button.addTarget(self, action: #selector(buttonActRight), forControlEvents: .TouchUpInside)
        
        let itemRight = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = itemRight
    }
    
    func setUI() {
        self.tableView = UITableView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT), style: UITableViewStyle.Plain)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.view.addSubview(self.tableView!)
    }
    
    // MARK: Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSource == nil {
            return 0
        }
        return dataSource!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "Cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = dataSource![indexPath.row] as? String
        
        return cell!;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let vc = UIViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}