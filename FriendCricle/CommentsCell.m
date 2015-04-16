//
//  CommentsCell.m
//  FriendCricle
//
//  Created by 闫潇 on 15/4/12.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "CommentsCell.h"
@interface CommentsCell()
@property (strong, nonatomic) IBOutlet UIImageView *headIcon;
@property (strong, nonatomic) IBOutlet UIButton *userName;
@property (strong, nonatomic) IBOutlet UILabel *userDescription;
@property (strong, nonatomic) IBOutlet UILabel *labTimer;
    
@end
@implementation CommentsCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setCellInfo
{
    self.headIcon.image=[UIImage imageNamed:@"me"];
    [self.userName setTitle:@"韩寒" forState:UIControlStateNormal];
    self.userDescription.text=@"其实一开始他们叫我代言，我是不愿意的，后来加了特技，Duang！";
    self.labTimer.text=[self date];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(NSString *)date
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //输出格式为：2010-10-27 10:22:13
    
    return currentDateStr;
}
@end
