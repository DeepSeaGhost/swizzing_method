//  mthodSwizzing  PVC1.m.
//  Created 2018/5/9.

#import "PVC1.h"
#import "PVC2.h"

@implementation PVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(next:)];
}
- (void)done:(UIBarButtonItem *)item {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)next:(UIBarButtonItem *)item {
    [self.navigationController pushViewController:[PVC2 new] animated:YES];
}
@end
