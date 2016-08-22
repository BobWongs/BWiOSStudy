//
//  UIViewController+BWMethodSwizzling.m
//  BWObjective-CStudy-iOS
//
//  Created by BobWong on 16/8/22.
//  Copyright © 2016年 BobWong. All rights reserved.
//

#import "UIViewController+BWMethodSwizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (BWMethodSwizzling)

/*----------------------
    机制
        +load方法是在类被加载的时候调用的
    Reference
        为何选择+load
            +load 和 +initialize 是 Objective-C runtime 会自动调用的两个类方法。但是它们被调用的时机却是有差别的，+load 方法是在类被加载的时候调用的，而 +initialize 方法是在类或它的子类收到第一条消息之前被调用的，这里所指的消息包括实例方法和类方法的调用。也就是说 +initialize 方法是以懒加载的方式被调用的，如果程序一直没有给某个类或它的子类发送消息，那么这个类的 +initialize 方法是永远不会被调用的。此外 +load 方法还有一个非常重要的特性，那就是子类、父类和分类中的 +load 方法的实现是被区别对待的。换句话说在 Objective-C runtime 自动调用 +load 方法时，分类中的 +load 方法并不会对主类中的 +load 方法造成覆盖。综上所述，+load 方法是实现 Method Swizzling 逻辑的最佳“场所”。
        为何Dispatch Once
             +load 方法在类加载的时候会被 runtime 自动调用一次，但是它并没有限制程序员对 +load 方法的手动调用。什么？你说不会有程序员这么干？那可说不定，我还见过手动调用 viewDidLoad 方法的程序员，就是介么任性。而我们所能够做的就是尽可能地保证程序能够在各种情况下正常运行。
        为何要加判断
            我们使用 Method Swizzling 的目的通常都是为了给程序增加功能，而不是完全地替换某个功能，所以我们一般都需要在自定义的实现中调用原始的实现。所以这里就会有两种情况需要我们分别进行处理：
                    主类本身有实现需要替换的方法，也就是 class_addMethod 方法返回 NO 。这种情况的处理比较简单，直接交换两个方法的实现就可以了；
                    主类本身没有实现需要替换的方法，而是继承了父类的实现，即 class_addMethod 方法返回 YES 。这时使用 class_getInstanceMethod 函数获取到的 originalSelector 指向的就是父类的方法，我们再通过执行 class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod)); 将父类的实现替换到我们自定义的 mrc_viewWillAppear 方法中。这样就达到了在 mrc_viewWillAppear 方法的实现中调用父类实现的目的。
    研究方向
        Objective-C中方法Method的数据结构；
        Objective-C语言的深入研究；
----------------------*/
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(bw_viewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

/*----------------------
    说明
        这里不是递归，这里的实现跟viewDidLoad的实现交换了，交换的是“{ }”中的实现；
        使用self的原因是，如果有重写方法，会调回重写后的方法，而不是父类方法；
 ----------------------*/
- (void)bw_viewDidLoad {
    [self bw_viewDidLoad];
    
    NSLog(@"bw customize viewDidLoad from vc: %@", NSStringFromClass([self class]));
}

@end
