//
//  XTimer.m
//  XTimer
//
//  Created by xlx on 16/1/1.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "XTimer.h"

@implementation XTimer
{
    BOOL isStop;
    dispatch_source_t source;
}

+ (nullable XTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(nullable id)aTarget selector:(nullable SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    XTimer *timer = [[XTimer alloc]init];
    timer.ti = ti;
    timer.atarget = aTarget;
    timer.aSelector = aSelector;
    timer.userInfo = userInfo;
    timer.repeats = yesOrNo;
    [timer repeatSelector];
    return timer;
}

-(void)repeatSelector{
    if (!self.repeats) {
        [self.atarget performSelectorOnMainThread:self.aSelector withObject:self.userInfo waitUntilDone:false];
        return;
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(source, dispatch_time(DISPATCH_TIME_NOW, self.ti * NSEC_PER_SEC), self.ti * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(source, ^{
        if (self->isStop) {
            return;
        }else{
            [self.atarget performSelectorOnMainThread:self.aSelector withObject:self.userInfo waitUntilDone:false];
        }
    });
    dispatch_resume(source);
}
- (void)reStart{
    isStop = false;
}
- (void)stop{
    isStop = true;
}
- (void)invalidate{
    dispatch_source_cancel(source);
}
@end
