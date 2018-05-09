//  mthodSwizzing  Replace.m.
//  Created 2018/5/9.

#import "Replace.h"
#import <objc/runtime.h>

@implementation Replace
+ (void)load {
    class_replaceMethod(self, @selector(sleep), sleepFunction, "");
}
+ (void)sleep {
    NSLog(@"马上睡");
}
void sleepFunction() {
    NSLog(@"还不想睡");
}
@end
