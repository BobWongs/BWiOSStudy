//
//  BWRuntimeController.m
//  BWObjective-CStudy-iOS
//
//  Created by BobWong on 16/8/22.
//  Copyright © 2016年 BobWong. All rights reserved.
//

#import "BWRuntimeController.h"
#import "NSObject+BWAdd.h"

@interface BWRuntimeController ()

@end

@implementation BWRuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self objectBindProperty];
}

/*------------------------
    对象属性的动态绑定
------------------------*/
- (void)objectBindProperty {
    NSObject *obj = [NSObject new];
    obj.bw_name = @"hello";
    NSLog(@"bw_name is %@", obj.bw_name);
}

/*------------------------
    方法交换、全局修改
------------------------*/
- (void)methodSwizzling {
    // Reference: UIViewController+BWMethodSwizzling.m文件
}

@end
