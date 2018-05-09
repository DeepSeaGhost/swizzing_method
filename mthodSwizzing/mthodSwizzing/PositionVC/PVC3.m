//  mthodSwizzing  PVC3.m.
//  Created 2018/5/9.

#import "PVC3.h"

@implementation PVC3
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
}
- (void)done:(UIBarButtonItem *)item {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
