//
//  WXWebViewController.m
//  WeexDemo
//
//  Created by master on 17/3/29.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "WXWebViewController.h"

@implementation WXWebViewController
- (instancetype)init
{
    if (self = [super init]) {
    }
    
    return self;
}

 

- (void)viewDidLoad
{
    [super viewDidLoad];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 400, 800)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.15:8080/index.html?skinType=0"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
}
@end
