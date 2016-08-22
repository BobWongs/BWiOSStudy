//
//  UIViewController+BWAdd.m
//  BWObjective-CStudy-iOS
//
//  Created by BobWong on 16/8/22.
//  Copyright © 2016年 BobWong. All rights reserved.
//

#import "UIViewController+BWAdd.h"

@implementation UIViewController (BWAdd)

/*------------------
    再次实现+load方法，不会和原来的方法冲突
------------------*/
+ (void)load {
    NSLog(@"customize load method once again!");
}

@end
