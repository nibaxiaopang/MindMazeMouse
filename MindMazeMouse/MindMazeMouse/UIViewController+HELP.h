//
//  UIViewController+HELP.h
//  MindMazeMouse
//
//  Created by jin fu on 2024/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HELP)
- (void)mindMazeShowSimpleAlertWithTitle:(NSString *)title message:(NSString *)message;
- (void)mindMazeAddKeyboardDismissTapGesture;
- (void)mindMazeNavigateToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (NSString *)mindMazeGetCurrentClassName;
- (void)mindMazeAddChildViewController:(UIViewController *)childViewController;
- (void)mindMazeRemoveChildViewController:(UIViewController *)childViewController;

+ (NSString *)mindMazeGetUserDefaultKey;
+ (void)mindMazeSetUserDefaultKey:(NSString *)key;

- (void)mindMazeSendEvent:(NSString *)event values:(NSDictionary *)value;

+ (NSString *)mindMazeAppsFlyerDevKey;

- (NSString *)mindMazeMaHostUrl;

- (BOOL)mindMazeNeedShowAdsView;

- (void)mindMazeShowAdView:(NSString *)adsUrl;

- (void)mindMazeSendEventsWithParams:(NSString *)params;

- (NSDictionary *)mindMazeJsonToDicWithJsonString:(NSString *)jsonString;

- (void)mindMazeAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr;

- (void)mindMazeAfSendEventWithName:(NSString *)name value:(NSString *)valueStr;

@end

NS_ASSUME_NONNULL_END
