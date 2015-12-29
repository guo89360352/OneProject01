//
//  NetWorkEngine.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "NetWorkEngine.h"

@interface NetWorkEngine ()
@property(nonatomic,copy) NSString *urlString;
@property(nonatomic,retain)NSDictionary *parameters;
@property(nonatomic,assign) id<NetWorkEngineDelegate>delegate;
@property(nonatomic,assign)NetWorkEngineType netWorkType;

@end


@implementation NetWorkEngine

+(instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkType{
    NetWorkEngine *netWorkEngine = [[NetWorkEngine alloc] initWithUrlString:urlString parameters:parameters requestDelegate:delegate httpMethodType:netWorkType];
    return netWorkEngine;
}

- (instancetype)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkType{
    
    self = [super init];
    if (self) {
        self.urlString = urlString;
        self.parameters = parameters;
        self.delegate = delegate;
        self.netWorkType = netWorkType;
    }
    return self;
}


//7.开始网络请求

- (void)startRequestNetWork{
    //7.1把请求网址字符串转化为NSURL
    NSURL *url = [NSURL URLWithString:self.urlString];
    //7.2创建一个网络请求对象,赋初值nil
    NSMutableURLRequest *request = nil;
    //7.3判断网络类型
    if (self.netWorkType == NetWorkEngineTypeGET) {
        //GET请求
        //添加请求网址
        request = [NSMutableURLRequest requestWithURL:url];
        //设置请求类型
        [request setHTTPMethod:@"GET"];
        
        
    }else if (self.netWorkType == NetWorkEngineTypePOST){
        //10.POST请求
        request = [NSMutableURLRequest requestWithURL:url];
        //设置请求方式
        [request setHTTPMethod:@"POST"];
        
        //配置post请求参数
        if (self.parameters) {
            [request setHTTPBody:[self parametersTransformToHTTPBody]];
        }
        
        
    }
    
    //12.设置请求超时时间 时间超过15秒则返回请求失败
    [request setTimeoutInterval:15.0];
    
    
    //9.在网络请求开始的时候把网络请求开始方法传给代理对象
    if (self.delegate && [self.delegate respondsToSelector:@selector(netWorkDidStartLoading:)]) {
        [self.delegate netWorkDidStartLoading:self];
    }
    
    //8.异步链接实现网络请求（block)
    
    __block NetWorkEngine *weakEngine = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //8.1如果error存在说明请求出错
        if (connectionError) {
            NSLog(@"%@",connectionError);
        }else{
            
            //8.2判断代理，是否存在 且 执行
            if (self.delegate &&[self.delegate respondsToSelector:@selector(netWorkDidFinishLoading:withResponseObject:)]) {
                
                //8.3JSON解析
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                
                //8.4把数据传给代理对象
                [self.delegate netWorkDidFinishLoading:weakEngine withResponseObject:dic];
            }
            
        }
        
    }];
    
}

//11. 把用户传递的post请求参数转化为NSData类型
- (NSData *)parametersTransformToHTTPBody{
    
    //11.1获取字典所有的键值key
    NSArray *keyArray = self.parameters.allKeys;
    //11.2创建一个可变数组存放所有的键值
    NSMutableArray *keyValueArray = [NSMutableArray new];
    
    for (NSString *key in keyArray) {
        NSString *param = [NSString stringWithFormat:@"%@=%@",key,self.parameters[key]];
        [keyValueArray addObject:param];
    }
    
    //11.3将数组的元素拼接上&符号
    NSString *paramter = [keyValueArray componentsJoinedByString:@"&"];
    //11.4把字符串类型转化为NSData类型
    NSData *httpBodyData = [paramter dataUsingEncoding:NSUTF8StringEncoding];
    return httpBodyData;
    
    
}




@end
