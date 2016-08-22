//
//  NSObject+BWAdd.m
//  BWObjective-CStudy-iOS
//
//  Created by BobWong on 16/8/22.
//  Copyright © 2016年 BobWong. All rights reserved.
//

#import "NSObject+BWAdd.h"
#import <objc/runtime.h>

@implementation NSObject (BWAdd)

/*----------------------
    存在疑问
        对是否使用static关键字的思考？
----------------------*/
static const char kBw_name = '\0';
- (void)setBw_name:(NSString *)bw_name {
    objc_setAssociatedObject(self, &kBw_name, bw_name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)bw_name {
    return objc_getAssociatedObject(self, &kBw_name);
}

@end
