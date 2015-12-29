//
//  TwoTableViewCell.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "TwoTableViewCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface TwoTableViewCell ()

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIImageView *ImageView;
@property (nonatomic, retain) UILabel *timeLabel;

@end

@implementation TwoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configLoadingView];
    }
    return self;
}

-(void)configLoadingView{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, [UIScreen mainScreen].bounds.size.width - 80, 30)];
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 85, 85)];
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 60, [UIScreen mainScreen].bounds.size.width - 100, 30)];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.ImageView];
    [self.contentView addSubview:self.timeLabel];
}

- (void)setModel:(Model *)model{
    self.titleLabel.text = model.title;
    self.ImageView.image = [UIImage imageNamed:model.imglink];
    self.timeLabel.text = model.date;
    
    self.titleLabel.text = model.title;
    self.ImageView.image = [UIImage imageNamed:model.imglink];
    self.timeLabel.text = model.date;
    self.timeLabel.font = [UIFont systemFontOfSize:14.0];
    CGFloat height = [[self class] getTextHeightWithText:model.title];
    CGRect frame = self.titleLabel.frame;
    frame.size.height = height;
    self.titleLabel.frame = frame;
    self.titleLabel.font = [UIFont systemFontOfSize:20.0];
    
    
}

+(CGFloat)getTextHeightWithText:(NSString *)str{
    CGRect textRect = [str boundingRectWithSize:CGSizeMake(kWidth * 0.75, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil];
    return textRect.size.height;
    
}
+(CGFloat)getCellHeightWithModel:(Model *)model{
    
    CGFloat textHeight = [[self class] getTextHeightWithText:model.title];
    
    return textHeight + kWidth / 4 / 4 + 15;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
