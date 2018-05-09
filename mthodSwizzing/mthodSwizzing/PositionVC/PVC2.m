//  mthodSwizzing  PVC2.m.
//  Created 2018/5/9.

#import "PVC2.h"
#import "PVC3.h"

@implementation PVC2
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(next:)];
}
- (void)done:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)next:(UIBarButtonItem *)item {
    [self.navigationController pushViewController:[PVC3 new] animated:YES];
}
@end
