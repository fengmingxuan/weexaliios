//
//  WeeXBaseViewController.h
//  WeexDemo
//
//  Created by master on 17/3/30.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>

 
#import <UIKit/UIKit.h>

/**
 * The WXBaseViewController class provides the infrastructure for managing the weex view in your app. It is
 * responsible for creating a weex instance or rendering the weex view, for observing the lifecycle of the
 * view such as "appear" or "disappear"、"foreground" or "background" etc. You can initialize this controller by
 * special bundle URL.
 */

@interface WeeXBaseViewController : UIViewController <UIGestureRecognizerDelegate>

/**
 * @abstract initializes the viewcontroller with bundle url.
 *
 * @param sourceURL The url of bundle rendered to a weex view.
 *
 * @return a object the class of WXBaseViewController.
 *
 */
- (instancetype)initWithSourceURL:(NSURL *)sourceURL wxoptions:(NSDictionary*)wxoptions;

/**
 * @abstract refreshes the weex view in controller.
 */
- (void)refreshWeex;

@end
