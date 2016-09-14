//
//  ViewController.m
//  aa
//
//  Created by ___liangdahong on 16/9/14.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "bmtestViewController.h"
#import "ViewController.h"

@interface ViewController (Block)

- (void)setBlock:(dispatch_block_t)block;

@end

@implementation ViewController (Block)


- (void)setBlock:(dispatch_block_t)block {
}


@end


@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma clang diagnostic ignored "-Wobjc-property-synthesis"

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    bmtestViewController *c = [bmtestViewController new];
    c.block = ^{
        self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    };
    [self.navigationController pushViewController:c animated:YES];
}

@end

