//
//  Model.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.imglink = dic[@"imglink"];
        self.date = dic[@"date"];
    }
    return self;
}

@end
