////
////  WXSJNetworkDefaultlmpl.m
////  WeexDemo
////
////  Created by master on 17/3/29.
////  Copyright © 2017年 taobao. All rights reserved.
////
//
//#import "WXSJNetworkDefaultlmpl.h"
//#import <WeexSDK/WeexSDK.h>
//@interface WXNetworkCallbackInfo : NSObject
//
//@property (nonatomic, copy) void(^sendDataCallback)(int64_t, int64_t);
//@property (nonatomic, copy) void(^responseCallback)(NSURLResponse *);
//@property (nonatomic, copy) void(^receiveDataCallback)(NSData *);
//@property (nonatomic, strong) NSMutableData *data;
//@property (nonatomic, copy) void(^compeletionCallback)(NSData *, NSError *);
//
//@end
//
//@implementation WXSJNetworkDefaultlmpl
//{
//    NSMutableDictionary *_callbacks;
//    NSURLSession *_session;
//}
//- (id)sendRequest:(NSURLRequest *)request withSendingData:(void (^)(int64_t, int64_t))sendDataCallback
//     withResponse:(void (^)(NSURLResponse *))responseCallback
//  withReceiveData:(void (^)(NSData *))receiveDataCallback
//  withCompeletion:(void (^)(NSData *, NSError *))compeletionCallback
//{
//    /*拦截了URL 如果没有域名时 添加上域名 为了保持三端同步使用 我们域名放在每个端添加*/
//    if (![request.URL.absoluteString hasPrefix:@"http"]) {
//        request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"",request.URL.absoluteString]]];
//    }
//    WXNetworkCallbackInfo *info = [WXNetworkCallbackInfo new];
//    info.sendDataCallback = sendDataCallback;
//    info.responseCallback = responseCallback;
//    info.receiveDataCallback = receiveDataCallback;
//    info.compeletionCallback = compeletionCallback;
//    
//    if (!_session) {
//        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
//                                                 delegate:self
//                                            delegateQueue:[NSOperationQueue mainQueue]];
//    }
//    
//    NSURLSessionDataTask *task = [_session dataTaskWithRequest:request];
//    if (!_callbacks) {
//        _callbacks = [NSMutableDictionary dictionary];
//    }
//    [_callbacks setObject:info forKey:task];
//    [task resume];
//    
//    return task;
//}
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
//   didSendBodyData:(int64_t)bytesSent
//    totalBytesSent:(int64_t)totalBytesSent
//totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
//{
//    WXNetworkCallbackInfo *info = [_callbacks objectForKey:task];
//    if (info.sendDataCallback) {
//        info.sendDataCallback(totalBytesSent, totalBytesExpectedToSend);
//    }
//}
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)task
//didReceiveResponse:(NSURLResponse *)response
// completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
//{
//    WXNetworkCallbackInfo *info = [_callbacks objectForKey:task];
//    if (info.responseCallback) {
//        info.responseCallback(response);
//    }
//    completionHandler(NSURLSessionResponseAllow);
//}
//
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)task didReceiveData:(NSData *)data
//{
//    WXNetworkCallbackInfo *info = [_callbacks objectForKey:task];
//    if (info.receiveDataCallback) {
//        info.receiveDataCallback(data);
//    }
//    
//    NSMutableData *mutableData = info.data;
//    if (!mutableData) {
//        mutableData = [NSMutableData new];
//        info.data = mutableData;
//    }
//    
//    [mutableData appendData:data];
//}
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
//{
//    WXNetworkCallbackInfo *info = [_callbacks objectForKey:task];
//    if (info.compeletionCallback) {
//        info.compeletionCallback(info.data, error);
//    }
//    [_callbacks removeObjectForKey:task];
//}
//
//@end
