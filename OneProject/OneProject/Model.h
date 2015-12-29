//
//  Model.h
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *imglink;
@property(nonatomic, copy)NSString *date;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
