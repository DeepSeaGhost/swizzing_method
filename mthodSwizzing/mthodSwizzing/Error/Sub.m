//  mthodSwizzing  Sub.m.
//  Created 2018/5/9.

#import "Sub.h"
#import <objc/runtime.h>

@implementation Sub
+ (void)load {
    //取代实现
    class_replaceMethod(objc_getMetaClass(object_getClassName(self)), @selector(run), replaceRun, "");
    
    //添加实现
    class_addMethod(objc_getMetaClass(object_getClassName(self)), @selector(eat), addEat, "");
    
    //交换实现
    method_exchangeImplementations(class_getClassMethod(self, @selector(sleep)), class_getClassMethod(self, @selector(changeMethod)));
}


//取代的实现
void replaceRun() {
    NSLog(@"ErrorSub_取代了跑的实现，不想跑");
}

//添加实现
void addEat() {
    NSLog(@"ErrorSub_添加了吃的实现，不想吃");
}


//交换的方法
+ (void)changeMethod {
    NSLog(@"ErrorSub_交换的方法");
}
@end
