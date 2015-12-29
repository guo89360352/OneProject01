//
//  NetWorkEngine.h
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NetWorkEngineTypeGET,
    NetWorkEngineTypePOST,
    NetWorkEngineTypePUT,
    NetWorkEngineTypeDELETE
    
}NetWorkEngineType;

@class NetWorkEngine;
@protocol NetWorkEngineDelegate <NSObject>

- (void)netWorkDidStartLoading:(NetWorkEngine *)netWorkEngine;
- (void)netWorkDidFinishLoading:(NetWorkEngine *)netWorkEngine withResponseObject:(id)responseObject;


@end

@interface NetWorkEngine : NSObject

+ (instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkType;

- (void)startRequestNetWork;

@end
