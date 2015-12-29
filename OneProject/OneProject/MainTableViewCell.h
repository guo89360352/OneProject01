//
//  MainTableViewCell.h
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface MainTableViewCell : UITableViewCell
@property(retain,nonatomic)Model *model;
+(CGFloat)getCellHeightWithModel:(Model *)model;
@end
