# XTimer
The role of XTimer and NSTimer is similar and it does not cause memory leaks;
XTimer has three function,you can stop and reStart the XTimer;

How to use
```
timer = [XTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(XTimerSelector:) userInfo:@{@"key":@"value"} repeats:true];
```
stop timer
```
    [timer stop];
```
reStart timer
```
    [timer reStart];
```
invalidate timer
```
    [timer invalidate];
```
