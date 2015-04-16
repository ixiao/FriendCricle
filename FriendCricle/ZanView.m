//
//  ZanView.m
//  FriendCricle
//
//  Created by 闫潇 on 15/4/12.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "ZanView.h"


@interface ZanView ()
{
    NSInteger llll;
}
@property (nonatomic,strong)NSMutableArray * icon_arr;

@end

@implementation ZanView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    self.icon_arr = [NSMutableArray arrayWithCapacity:0];
    //
    for (int i = 1; i<12; i++) {
        NSString * imageNmae = [NSString stringWithFormat:@"%03d.png",i];
        UIImage * image = [UIImage imageNamed:imageNmae];
        
        [self.icon_arr addObject:image];
    }
    
    for (int i = 0 ; i< self.icon_arr.count; i++) {
        UIButton * button = [[UIButton alloc]init];
        NSInteger button_width = 20;
        NSInteger button_height = button_width;
        
//        NSInteger width = 300;
//        NSInteger height = self.icon_arr.count/6+0.9;
        
        NSInteger a = i%9;
        NSInteger b = i/9;
        
        NSInteger x = a * button_width+10;
        NSInteger y = b * button_width + 10;
        
        CGRect frame = CGRectMake(x,y, button_width, button_height);
        
        button.frame = frame;
        
        UIImage * image = self.icon_arr[i];
        
        [button setBackgroundImage:image forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        CGFloat height = y + button_height;
//        NSLog(@"~~~~~~%f",self.frame.size.height);
        CGRect  myView ;
        
        
        myView = self.frame;
        myView.size.height=height;
        self.frame = myView;
//        NSLog(@"!!!!!!!!%f",self.frame.size.height);
    }

}

-(void)tapButton
{
    NSLog(@"你摸了我");
}


@end
