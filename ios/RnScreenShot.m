#import "RnScreenShot.h"
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>

@implementation RnScreenShot
RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents {
    return @[@"ScreenshotTaken"];
}

- (void)setupAndListen:(RCTBridge*)bridge {
    // First set up native bridge
    [self setBridge:bridge];
    // Now set up handler to detect if user takes a screenshot
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationUserDidTakeScreenshotNotification
                                                      object:nil
                                                       queue:mainQueue
                                                  usingBlock:^(NSNotification *notification) {
                                                      [self screenshotDetected:notification];
                                                  }];
}

- (void)screenshotDetected:(NSNotification *)notification {
    [self.bridge.eventDispatcher sendAppEventWithName:@"ScreenshotTaken" body:nil];
}

@end
