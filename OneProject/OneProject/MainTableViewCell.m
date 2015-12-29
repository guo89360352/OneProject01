//
//  MainTableViewCell.m
//  OneProject
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 苹果IOS. All rights reserved.
//

#import "MainTableViewCell.h"
#import <UIImageView+WebCache.h>
#define kWidth    [UIScreen mainScreen].bounds.size.width


@interface MainTableViewCell ()
@property(nonatomic,retain)UILabel *titleLable;
@property(nonatomic,retain)UIImageView *imageV;
@property(nonatomic,retain)UILabel *timeLable;


@end



@implementation MainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configView];
    }

    return self;

}
-(void)configView{

    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(86, 0, kWidth-80, 44)];
    [self addSubview:self.titleLable];
    self.titleLable.font=[UIFont systemFontOfSize:18];
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(5,0, 66, 66)];
    
    [self addSubview:self.imageV];
    
    self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(86, 44, kWidth-80, 22)];
    self.timeLable.font=[UIFont systemFontOfSize:15];
    
    [self addSubview:self.timeLable];
    



}
-(void)setModel:(Model *)model{
    NSLog(@"%@",model.imglink);
    self.titleLable.text = model.title;
    self.timeLable.text = model.date;
    self.timeLable.textColor = [UIColor lightGrayColor];
    NSURL *url=[NSURL URLWithString:model.imglink];
    
    UIImage *image=[UIImage imageNamed:@"zhang"];
    
    [self.imageV sd_setImageWithURL:url placeholderImage:image];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
