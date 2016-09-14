//
//  bmtestViewController.m
//  aa
//
//  Created by ___liangdahong on 16/9/14.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "bmtestViewController.h"

@interface BMPerson : NSObject

@property (nonatomic, copy) dispatch_block_t block;

@end

@implementation BMPerson

@end


@interface bmtestViewController ()
@property (nonatomic, strong) BMPerson *per;
@property (nonatomic, strong) UIView *myView;

@end

@implementation bmtestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myView = [UIView new];

    self.per = [BMPerson new];
    __weak typeof(self) wself = self;
    self.per.block = ^{
        __strong typeof(wself) self = wself;
        
        self.block();
//        wself.myView = [UIView new];
    };
}

- (void)dealloc {
    
    NSLog(@"bmtestViewController dealloc");
}

- (void)test {
    NSLog(@"test");
}

+ (void)test2 {
    NSLog(@"test2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    __weak bmtestViewController *wself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        __strong bmtestViewController * sself = wself;

//        sself.block;
        NSLog(@"%@", sself.title);
        
        [sself test];
    });
}

@end
