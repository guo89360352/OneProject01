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
    
//    self.imageV.layer.cornerRadius=33;
//    
//    self.imageV.clipsToBounds=YES;
    
    
    [self addSubview:self.imageV];
    
    self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(86, 44, kWidth-80, 22)];
    self.timeLable.font=[UIFont systemFontOfSize:15];
    
    [self addSubview:self.timeLable];
    



}
-(void)setModel:(Model *)model{
    NSLog(@"%@",model.imglink);
    self.titleLable.text = model.title;
//    self.imageV.image = [UIImage imageNamed:model.imglink];
    self.timeLable.text = model.date;
//    CGFloat height = [[self class] getTextHeightWithText:model.title];
//    CGRect frame = self.titleLable.frame;
//    frame.size.height = height;
//    self.titleLable.frame = frame;
//    self.titleLable.font = [UIFont systemFontOfSize:15.0];
    
    
    
    
    
    NSURL *url=[NSURL URLWithString:model.imglink];
    
    UIImage *image=[UIImage imageNamed:@"zhang"];
    
    
    [self.imageV sd_setImageWithURL:url placeholderImage:image];
    


    





}
//+(CGFloat)getTextHeightWithText:(NSString *)str{
//    //计算文本高度的核心方法！！
//    //boundingRectWithSize当获取指定文字高度的时候需要一个CGSize类型的参数，需要让文字在这个限定的宽度和高度区域内显示通常宽度和你要显示的Label的宽度保持一致，高度尽可能的设置高一点
//    //options是文字显示的方式
//    //attributes设置文字相关的属性
//    //context是文本绘制的上下文，一般不直接设置，直接写nil
//    CGRect textRect = [str boundingRectWithSize:CGSizeMake(kWidth*0.75, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil];
//    return textRect.size.height;
//    
//}
////获取整个cell的高度，车名label高度+品牌介绍label高度
//+(CGFloat)getCellHeightWithModel:(Model *)model{
//    
//    CGFloat textHeight = [[self class] getTextHeightWithText:model.title];
//    
//    return textHeight + kWidth/4/4+15;
//    
//}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
