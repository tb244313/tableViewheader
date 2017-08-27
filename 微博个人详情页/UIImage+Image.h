//
//  UIImage+Image.h
//  微博个人详情页
//
//  Created by apple on 2017/8/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

//根据颜色生成一张尺寸为1*1的相同颜色图片
+(UIImage *)imageWithColor:(UIColor *)color;

@end
