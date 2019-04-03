//
//  XViewController.m
//  XTimer
//
//  Created by StrongX on 01/26/2019.
//  Copyright (c) 2019 StrongX. All rights reserved.
//

#import "XViewController.h"
#import "XTimer.h"

@interface XViewController ()

@end

@implementation XViewController
{
    XTimer *timer;
}
-(void)dealloc{
    NSLog(@"XViewController release");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    timer = [XTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(action:) userInfo:@{@"key":@"value"} repeats:true];
}

-(void)action:(NSNotification *)info{
    NSLog(@"%@",info);
    NSLog(@"%@",[NSThread currentThread]);
}
- (IBAction)stop:(id)sender {
    [timer stop];
}
- (IBAction)reStart:(id)sender {
    [timer reStart];
}
- (IBAction)invalidate:(id)sender {
    [timer invalidate];
}

@end
