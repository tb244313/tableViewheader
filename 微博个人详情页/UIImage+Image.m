//
//  UIImage+Image.m
//  微博个人详情页
//
//  Created by apple on 2017/8/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
+(UIImage *)imageWithColor:(UIColor *)color
{
    //描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 0.0f, 0.0f);
    
    //开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    
    //获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //使用color掩饰填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    //渲染上下文
    CGContextFillRect(context, rect);
    
    //从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsGetCurrentContext();
    
    return theImage;
}
@end
