//
//  ViewController.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkEngine.h"

@interface ViewController ()<NetWorkEngineDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NetWorkEngine *netWorkEngine = [NetWorkEngine netWorkEngineWithUrlString:@"http://api.milltary.app887.com/api/Articles.action?opc=10&npc=0&type=%E6%9C%80%E6%96%B0%E9%B2%9C" parameters:nil requestDelegate:self httpMethodType:NetWorkEngineTypeGET];
    [netWorkEngine startRequestNetWork];

}

- (void)netWorkDidStartLoading:(NetWorkEngine *)netWorkEngine{
    NSLog(@"网络请求开始");
}
- (void)netWorkDidFinishLoading:(NetWorkEngine *)netWorkEngine withResponseObject:(id)responseObject{
    NSLog(@"%@",responseObject );
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
