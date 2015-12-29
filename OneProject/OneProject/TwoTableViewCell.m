//
//  TwoTableViewCell.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "TwoTableViewCell.h"
#import <UIImageView+WebCache.h>
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
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 70, 70)];
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
    self.titleLabel.font = [UIFont systemFontOfSize:20.0];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    NSURL *url=[NSURL URLWithString:model.imglink];
    
    UIImage *image=[UIImage imageNamed:@"zhang"];
    
    [self.ImageView sd_setImageWithURL:url placeholderImage:image];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
