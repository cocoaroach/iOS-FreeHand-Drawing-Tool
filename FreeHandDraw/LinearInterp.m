//
//  LinearInterp.m
//  FreeHandDraw
//
//  Created by Sreejith on 01/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "LinearInterp.h"

@implementation LinearInterp
{
    UIBezierPath *path;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder: aDecoder])
    {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor: [UIColor whiteColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:2.0];
    }
    return self;
}

-(void) drawRect:(CGRect)rect {
    [[UIColor blackColor] setStroke];
    [path stroke];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

@end
