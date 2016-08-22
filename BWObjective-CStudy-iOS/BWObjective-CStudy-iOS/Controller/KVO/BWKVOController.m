//
//  BWKVOController.m
//  BWObjective-CStudy-iOS
//
//  Created by BobWong on 16/8/22.
//  Copyright © 2016年 BobWong. All rights reserved.
//

#import "BWKVOController.h"

#define H_SV 300
#define H_SV_CONTENT_SIZE 600
#define kContentOffset @"contentOffset"  // 是contentOffset，而不是_contentOffset

@interface BWKVOController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *viewChange;

@end

@implementation BWKVOController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self kvo_scrollView];
}

/*-------------------
    实现
        滚动UIScrollView，指定色块的Alpha值随着垂直滚动的偏离位置为变化
-------------------*/
- (void)kvo_scrollView {
    CGFloat h = 50;
    UIView *viewChange = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, h)];
    self.viewChange = viewChange;
    viewChange.center = CGPointMake(CGRectGetMidX(self.view.frame), 64 + 20 + h / 2);
    viewChange.backgroundColor = [UIColor blackColor];
    [self.view addSubview:viewChange];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(viewChange.frame) + 30, CGRectGetWidth(self.view.frame), H_SV)];
    self.scrollView = scrollView;
//    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.contentSize = CGSizeMake(0, H_SV_CONTENT_SIZE);
    [self.view addSubview:scrollView];
    
    [scrollView addObserver:self forKeyPath:kContentOffset options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

/*-------------------
    KVO
    Log数据
        keyPath: contentOffset
        object: <UIScrollView: 0x7faa4d087c00; frame = (0 164; 375 300); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x7faa4b745c70>; layer = <CALayer: 0x7faa4b739510>; contentOffset: {0, -0.5}; contentSize: {0, 600}>
        change: {
            kind = 1;
            new = "NSPoint: {0, -0.5}";
            old = "NSPoint: {0, -0.5}";
        }
 -------------------*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"keyPath: %@", keyPath);
    NSLog(@"object: %@", object);
    NSLog(@"change: %@", change);
    
    if (object == self.scrollView) {
        
        if ([keyPath isEqualToString:kContentOffset]) {
            UIScrollView *scrollView = (UIScrollView *)object;
            CGPoint contentOffSet = scrollView.contentOffset;
            CGFloat alpha = 1.0;
            alpha = 1 - contentOffSet.y / (H_SV_CONTENT_SIZE - H_SV);
            self.viewChange.alpha = alpha;
            
//            CGPoint contentOffSetNew = [change[NSKeyValueChangeNewKey] CGPointValue];
//            CGPoint contentOffSetOld = [change[NSKeyValueChangeOldKey] CGPointValue];
        }
    }
}

/*-------------------
    使用UIScrollView实现
-------------------*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    NSLog(@"scrollView contentOffset: %f, %f", point.x, point.y);
    
    CGFloat alpha = 1.0;
    alpha = 1 - point.y / (H_SV_CONTENT_SIZE - H_SV);
    self.viewChange.alpha = alpha;
//    self.navigationController.navigationBar.alpha = alpha;
}

- (void)dealloc {
    [self.scrollView removeObserver:self forKeyPath:kContentOffset];
}

@end
