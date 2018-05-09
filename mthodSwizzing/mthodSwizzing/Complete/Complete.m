//  mthodSwizzing  Complete.m.
//  Created 2018/5/9.

#import "Complete.h"
#import <objc/runtime.h>

@implementation Complete
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //获取需要交换的方法
        Method run = class_getClassMethod(self, @selector(run));
        Method eat = class_getClassMethod(self, @selector(eat));
        
        //添加eat方法 为什么要添加 是为了防止自身没有 而父类有 进行方法交换的时候 交换了父类的方法实现 显然这不是我们想要的
        //将run的实现添加到 新添加的eat方法上
        BOOL isAdd = class_addMethod(objc_getMetaClass(object_getClassName(self)), @selector(eat), method_getImplementation(run), method_getTypeEncoding(run));
        
        //判断
        if (isAdd) {
            //添加成功 表示自身确实没有eat方法
            //那么这个时候只需要将eat的方法实现 替换到 run方法上即可
            //是否还记得 判断之前我们添加过SEL为eat  IMP为run的实现 的eat方法
            class_replaceMethod(self, @selector(run), method_getImplementation(eat), method_getTypeEncoding(eat));
        }else {
            //添加失败  表示自身存在eat方法
            //那么这个时候只需要将 run 与 eat 的IMP(方法实现) 进行交换就好了
            method_exchangeImplementations(run, eat);
        }
    });
}

+ (void)run {
    NSLog(@"跑了");
}
+ (void)eat {
    NSLog(@"吃了");
}
@end
