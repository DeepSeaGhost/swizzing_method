//
//  UIViewController+swizzing.m
//  mthodSwizzing
//
//  Created by reset on 2018/5/9.
//  Copyright © 2018年 HangzhouVongi. All rights reserved.
//

#import "UIViewController+swizzing.h"
#import <objc/runtime.h>
#import "ViewController.h"
#import "PVC1.h"
#import "PVC2.h"
#import "PVC3.h"

@implementation UIViewController (swizzing)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method swizzMethod = class_getInstanceMethod(self, @selector(swizz_viewWillAppear:));
        
        BOOL isAdd = class_addMethod(self, @selector(viewWillAppear:), method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        
        if (isAdd) {
            class_replaceMethod(self, @selector(swizz_viewWillAppear:), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }else {
            method_exchangeImplementations(originalMethod, swizzMethod);
        }
    });
}

- (void)swizz_viewWillAppear:(BOOL)animated {
    //这里调用自身并不会引起递归
    //记得两个方法的实现已经进行交换了么
    //这里的调用 是激活了系统的方法实现
    [self swizz_viewWillAppear:animated];
    if ([self isKindOfClass:[ViewController class]]) {
        NSLog(@"当前控制器是ViewController");
    }else if ([self isKindOfClass:[PVC1 class]]) {
        NSLog(@"当前控制器是PVC1");
    }else if ([self isKindOfClass:[PVC2 class]]) {
        NSLog(@"当前控制器是PVC2");
    }else if ([self isKindOfClass:[PVC3 class]]) {
        NSLog(@"当前控制器是PVC3");
    }
}
@end
