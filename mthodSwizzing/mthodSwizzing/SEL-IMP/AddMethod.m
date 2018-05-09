//  mthodSwizzing  AddMethod.m.
//  Created 2018/5/9.

#import "AddMethod.h"
#import <objc/runtime.h>

@implementation AddMethod
+ (void)load {
    class_addMethod(objc_getMetaClass(object_getClassName(self)), @selector(work), workFunction, "");
}
void workFunction() {
    NSLog(@"上班");
}
@end
