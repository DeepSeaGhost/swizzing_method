//  mthodSwizzing  Change.m.
//  Created 2018/5/9.

#import "Change.h"
#import <objc/runtime.h>

@implementation Change
+ (void)load {
    Method eat = class_getClassMethod(self, @selector(eat));
    Method run = class_getClassMethod(self, @selector(run));
    method_exchangeImplementations(eat, run);
}

+ (void)eat {
    NSLog(@"吃了");
}
+ (void)run {
    NSLog(@"正准备跑");
}
@end
