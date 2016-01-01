//
//  XTimerViewController.m
//  XTimer
//
//  Created by xlx on 16/1/1.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "XTimerViewController.h"
#import "XTimer.h"

@interface XTimerViewController ()

@end

@implementation XTimerViewController
{
    XTimer *timer;
}
- (void)dealloc{
    NSLog(@"XTimerViewController release");
}
- (void)viewDidLoad {
    [super viewDidLoad];

    timer = [XTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(XTimerSelector:) userInfo:@{@"key":@"value"} repeats:true];
}

-(void)XTimerSelector:(NSDictionary *)info{
    NSLog(@"%@",info);
}
- (IBAction)reStart:(id)sender {
    [timer reStart];
}
- (IBAction)stop:(id)sender {
    [timer stop];
}
- (IBAction)invalidate:(id)sender {
    [timer invalidate];
}
@end
