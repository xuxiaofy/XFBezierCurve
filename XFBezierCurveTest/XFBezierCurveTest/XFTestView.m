//
//  XFTestView.m
//  XFBezierCurveTest
//
//  Created by tanky on 2016/11/15.
//  Copyright © 2016年 XXF. All rights reserved.
//

#import "XFTestView.h"
#import "UIView+XFBezierCurve.h"

@implementation XFTestView

- (void)drawRect:(CGRect)rect {
    [self test2];
}

/**
 随机数组
 */
- (void)test1{
    //x轴标注的最大值
    CGFloat maxX = 100;
    //y轴标注的最大值
    CGFloat maxY = 200;
    //存放所有点的数组
    NSMutableArray *points = [NSMutableArray array];
    for (int i = 0; i < 11; i ++) {
        CGPoint point = CGPointMake(maxX / 10 * i, arc4random_uniform(maxX));
        [points addObject:[NSValue valueWithCGPoint:point]];
        //        NSLog(@"point X = %f ------ Y = %f",point.x, point.y);
    }
    //线的颜色
    UIColor *lineColor = [UIColor redColor];
    //填充颜色
    UIColor *fillColor = [UIColor yellowColor];
    //调用分类方法进行绘制
    [self xf_loadBezierCurveWithMaxX:maxX andMaxY:maxY andPoints:points andLineColor:lineColor andLineWidth:10 andFillColor:fillColor];
}

/**
 自定义数组
 */
- (void)test2{
    //x轴标注的最大值
    CGFloat maxX = 100;
    //y轴标注的最大值
    CGFloat maxY = 200;
    //存放所有点的数组
    NSMutableArray *points = [NSMutableArray array];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(0, 180)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(10, 20)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(20, 160)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(30, 40)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(40, 140)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(50, 60)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(60, 160)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(70, 40)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(80, 180)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(90, 20)]];
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(100, 180)]];
    //线的颜色
    UIColor *lineColor = [UIColor redColor];
    //填充颜色
    UIColor *fillColor = [UIColor yellowColor];
    //调用分类方法进行绘制
    [self xf_loadBezierCurveWithMaxX:maxX andMaxY:maxY andPoints:points andLineColor:lineColor andLineWidth:10 andFillColor:fillColor];
}

@end
