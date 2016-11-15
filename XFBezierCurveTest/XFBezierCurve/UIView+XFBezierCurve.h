//
//  UIView+XFBezierCurve.h
//  XFBezierCurveTest
//
//  Created by tanky on 2016/11/15.
//  Copyright © 2016年 XXF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XFBezierCurve)

- (void)xf_loadBezierCurveWithMaxX:(CGFloat )maxX andMaxY:(CGFloat )maxY andPoints:(NSArray *)points andLineColor:(UIColor *)lineColor andLineWidth:(CGFloat )lineWidth andFillColor:(UIColor *)fillColor;

@end
