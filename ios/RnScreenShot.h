#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

@interface RnScreenShot : RCTEventEmitter <RCTBridgeModule>

- (void)setupAndListen:(RCTBridge *)bridge;
- (void)screenshotDetected:(NSNotification *)notification;

@end
