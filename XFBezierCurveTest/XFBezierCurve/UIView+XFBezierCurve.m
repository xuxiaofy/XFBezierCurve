//
//  UIView+XFBezierCurve.m
//  XFBezierCurveTest
//
//  Created by tanky on 2016/11/15.
//  Copyright © 2016年 XXF. All rights reserved.
//

#import "UIView+XFBezierCurve.h"

@implementation UIView (XFBezierCurve)

- (void)xf_loadBezierCurveWithMaxX:(CGFloat )maxX andMaxY:(CGFloat )maxY andPoints:(NSArray *)points andLineColor:(UIColor *)lineColor andLineWidth:(CGFloat )lineWidth andFillColor:(UIColor *)fillColor{
    
    if (lineColor) {
        [[UIColor redColor] setStroke];
    }
    
    CGFloat drawViewX = self.bounds.size.width;
    CGFloat drawViewY = self.bounds.size.height;
    
    NSMutableArray *newPoints = [NSMutableArray array];
    
    for (NSValue *point in points) {
        [newPoints addObject:[NSValue valueWithCGPoint:CGPointMake(point.CGPointValue.x / maxX * drawViewX, point.CGPointValue.y / maxY * drawViewY)]];
//        NSLog(@"X = %f ------ Y = %f",point.CGPointValue.x / maxX * drawViewX, point.CGPointValue.y / maxY * drawViewY);
    }
    
    [newPoints insertObject:[NSValue valueWithCGPoint:CGPointMake(0, drawViewY)] atIndex:0];
    
    [newPoints addObject:[NSValue valueWithCGPoint:CGPointMake(drawViewX, drawViewY)]];
    
    UIBezierPath *mPath = [UIBezierPath bezierPath];
    
    CGPoint firstPoint = [newPoints[0] CGPointValue];
    CGPoint secondPoint = [newPoints[1] CGPointValue];
    
    [mPath moveToPoint:firstPoint];
    [mPath addLineToPoint:secondPoint];
    for (int i = 1; i < newPoints.count; i ++) {
        firstPoint = secondPoint;
        secondPoint = [newPoints[i] CGPointValue];
        [mPath addCurveToPoint:secondPoint
                 controlPoint1:CGPointMake((secondPoint.x-firstPoint.x)/2+firstPoint.x, firstPoint.y)
                 controlPoint2:CGPointMake((secondPoint.x-firstPoint.x)/2+firstPoint.x, secondPoint.y)];
    }
    
    [mPath addLineToPoint:[[newPoints lastObject] CGPointValue]];
    [mPath addLineToPoint:[newPoints[0] CGPointValue]];
    [mPath stroke];
    
    if (lineWidth) {
        [mPath setLineWidth:lineWidth];
    }
    
    if (fillColor) {
        [fillColor setFill];
        [mPath fill];
    }
}

@end
