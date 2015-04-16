//
//  myCell.m
//  FriendCricle
//
//  Created by 闫潇 on 15/4/12.
//  Copyright (c) 2015年 yan. All rights reserved.
//

#import "myCell.h"
#import <Foundation/Foundation.h>
@interface myCell ()
{
    BOOL isOK;
    UIView * myView;
}
@property (strong, nonatomic) IBOutlet UIImageView *userIcon;
@property (strong, nonatomic) IBOutlet UIButton *userName;
@property (strong, nonatomic) IBOutlet UILabel *userDescription;

@property (strong, nonatomic) IBOutlet UILabel *txtTime;

@end

@implementation myCell

- (void)awakeFromNib {
    myView = [[UIView alloc]initWithFrame:CGRectMake(180, 170, 100, 40)];
    myView.backgroundColor=[UIColor colorWithRed:100/255.0 green:100/255.0 blue:118/255.0 alpha:1];
    [self.viewForBaselineLayout addSubview:myView];
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame=CGRectMake(0, 0, 50, 40);
    [btn1 setTintColor:[UIColor whiteColor]];
    [btn1 setTitle:@"赞" forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"AlbumInformationLikeHL"] forState:UIControlStateNormal];
    [myView addSubview:btn1];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame=CGRectMake(50, 0, 50, 40);
    [btn2 setTintColor:[UIColor whiteColor]];
    [btn2 setImage:[UIImage imageNamed:@"AlbumCommentSingleBigHL"] forState:UIControlStateNormal];
    [btn2 setTitle:@"评论" forState:UIControlStateNormal];
    [myView addSubview:btn2];
    myView.hidden=YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark 删除方法
- (IBAction)btnDele:(UIButton *)sender
{
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle: nil message:@"确定删除吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"删除", nil];
    [alert show];
}
#pragma mark 评论点赞按钮
- (IBAction)btnComment:(UIButton *)sender
{
    if (isOK==NO)
    {
        myView.hidden=NO;
        isOK=YES;
    }
    else
    {
    myView.hidden=YES;
        isOK=NO;
    }
    
}
#pragma mark 页面赋值(初始化)
-(void)setCellInfo
{

    NSString * str = @"是不是对生活不太满意，很久没有笑过又不知为何。既然不快乐又不喜欢这里，不如一路向西 去大理。路程有点波折，空气有点稀薄。景色越辽阔 心里越寂寞，不知道谁在 何处等待，不知道后来的后来。[爱你]";
    
    NSMutableAttributedString * attributedStr = [[NSMutableAttributedString alloc]initWithString:str];
//    self.userDescription.text=[NSString stringWithFormat:@"%@",attributedStr];
    
    
    NSString * path1 = [[NSBundle mainBundle] pathForResource:@"emoticons" ofType:@"plist"];
    
    NSArray * arr = [NSArray arrayWithContentsOfFile:path1];
    
    
    NSArray * result = [self tttString:str];
    
    //反向变量替换字符串，放在，前面字符串被替换后，后面的字符串位置发送改变
    for (NSInteger i = result.count -1; i>=0; i--)
    {
        NSTextCheckingResult * r = result[i];
        
        NSString * tempString = [str substringWithRange:r.range];
        tempString = [self fun1:tempString];
        
        for (int j = 0; j<arr.count; j++)
        {
            NSDictionary * dic = arr[j];
            NSString * dicName = dic[@"chs"];
            if ([@"[爱你]" isEqualToString:dicName])
            {
                NSString * imageName = dic[@"png"];
                NSLog(@"%@",imageName);
                
                UIImage * image = [UIImage imageNamed:imageName];
                
                UIImage * myIcon =[self scaleImage:image toSize:CGSizeMake(15, 15)];
                
                NSTextAttachment * attachment = [[NSTextAttachment alloc]init];
                attachment.image  = myIcon;
                
                NSAttributedString * imageString = [NSAttributedString attributedStringWithAttachment:attachment];
                NSLog(@"%@",imageString);
              [attributedStr replaceCharactersInRange:r.range withAttributedString:imageString];
                
                self.userDescription.attributedText = attributedStr;

                break;
            }
        }
        
        
        
    }
    
    
    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"测试富文本显示"] ;
    //为所有文本设置字体
//    [attributedString addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:24] range:NSMakeRange(0, [attributedString length])];
    //将“测试”两字字体颜色设置为蓝色
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:NSMakeRange(0, 2)];
    //将“富文本”三个字字体颜色设置为红色
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[NSColor redColor] range:NSMakeRange(2, 3)];
    
    //在“测”和“试”两字之间插入一张图片
//    NSString *imageName = @"taobao.png";
//    NSFileWrapper *imageFileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[[NSImage imageNamed:imageName] TIFFRepresentation]];
//    imageFileWrapper.filename = imageName;
//    imageFileWrapper.preferredFilename = imageName;
//    
//    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] initWithFileWrapper:imageFileWrapper];
//    NSAttributedString *imageAttributedString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
//    [attributedString insertAttributedString:imageAttributedString atIndex:1];
    
    /*
     其实插入图片附件之后 attributedString的长度增加了1 变成了8，所以可以预见其实图片附件属性对应的内容应该是一个长度的字符
     Printing description of attributedString:
     测{
     NSColor = "NSCalibratedRGBColorSpace 0 0 1 1";
     NSFont = "\"LucidaGrande 24.00 pt. P [] (0x10051bfd0) fobj=0x101e687f0, spc=7.59\"";
     }￼{
     NSAttachment = "<NSTextAttachment: 0x101e0c9c0> \"taobao.png\"";
     }试{
     NSColor = "NSCalibratedRGBColorSpace 0 0 1 1";
     NSFont = "\"LucidaGrande 24.00 pt. P [] (0x10051bfd0) fobj=0x101e687f0, spc=7.59\"";
     }富文本{
     NSColor = "NSCalibratedRGBColorSpace 1 0 0 1";
     NSFont = "\"LucidaGrande 24.00 pt. P [] (0x10051bfd0) fobj=0x101e687f0, spc=7.59\"";
     }显示{
     NSFont = "\"LucidaGrande 24.00 pt. P [] (0x10051bfd0) fobj=0x101e687f0, spc=7.59\"";
     }  
     */  
    
    

    
//    NSLog(@"%@",attributedStr);
    
//    self.userDescription.numberOfLines = 0;
        self.txtTime.text=[self date];
    self.userIcon.image=[UIImage imageNamed:@"me"];
    [self.userName setTitle:@"许巍" forState:UIControlStateNormal];
    
}

//将[太阳]---->太阳
-(NSString *)fun1:(NSString *)str
{
    NSString * str1 = [str substringWithRange:NSMakeRange(1, str.length-2)];
    
    return str1;
}

-(NSArray *)tttString:(NSString *)str
{
    //匹配 [中文文字]
    NSString * pattern = @"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]";
    //创建正则表达式对象NSRegularExpression
    NSError * error;
    NSRegularExpression * re = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    if (!re)
    {
        NSLog(@"%@",[error localizedDescription]);
    }
    //通过正则表达式对象，对字符串进行匹配
    NSArray * arr = [re matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    
    return arr;
    
    //数组中每一个元素是NSTextCheckingResult对象
    // NSTextCheckingResult * r;
    //NSRange range = r.range;
    
    
}

#pragma mark 剪裁图片
- (UIImage *)scaleImage:(UIImage *)img toSize:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
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
