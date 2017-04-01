/**
 * Created by Weex.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the Apache Licence 2.0.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import "WXEventModule.h"
#import "WXDemoViewController.h"
#import <WeexSDK/WXBaseViewController.h>
#import "WXWebViewController.h"

@implementation WXEventModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openURL:))

- (void)openURL:(NSString *)url
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        // relative path
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    
    UIViewController *controller = [[WXDemoViewController alloc] init];
    ((WXDemoViewController *)controller).url = [NSURL URLWithString:newURL];
    
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
}


WX_EXPORT_METHOD(@selector(openTopic:callback:))
- (void)openTopic:(NSDictionary *)param callback:(WXModuleCallback)callback
{
    NSString *newURL =  param[@"url"];
    if ([param[@"url"] hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", param[@"url"]];
    } else if (![param[@"url"] hasPrefix:@"http"]) {
        // relative path
        newURL = [NSURL URLWithString:param[@"url"] relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    
    UIViewController *controller = [[WXWebViewController alloc] init];
    ((WXWebViewController *)controller).url = [NSURL URLWithString:newURL];
    
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
}

@end