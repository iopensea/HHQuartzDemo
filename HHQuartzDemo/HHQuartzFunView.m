//
//  HHQuartzFunView.m
//  HHQuartzDemo
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HHQuartzFunView.h"
#import "UIColor+HHRandom.h"

@implementation HHQuartzFunView

- (CGRect)currentRect {
    return CGRectMake(_firstTouch.x,
                      _firstTouch.y,
                      _lastTouch.x - _firstTouch.x,
                      _lastTouch.y - _firstTouch.y);
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _currentColor = [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"comment_profile_mars"];
    }
    return self;
}

#pragma mark - Touch Handing

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_useRandomColor) {
        self.currentColor = [UIColor randomColor];
    }
    UITouch *touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    
    if (_shapeType == kImageShape) {
        CGFloat horOffset = _drawImage.size.width/2;
        CGFloat verOffset = _drawImage.size.height/2;
        _reddrawRect = CGRectUnion(_reddrawRect,
                                   CGRectMake(_lastTouch.x - horOffset,
                                              _lastTouch.y - verOffset,
                                              _drawImage.size.width,
                                              _drawImage.size.height));
    } else {
        _reddrawRect = CGRectUnion(_reddrawRect, self.currentRect);
    }
    _reddrawRect = CGRectInset(_reddrawRect, -2.0, -2.0);
    [self setNeedsDisplayInRect:_reddrawRect];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    
    if (_shapeType == kImageShape) {
        CGFloat horOffset = _drawImage.size.width/2;
        CGFloat verOffset = _drawImage.size.height/2;
        _reddrawRect = CGRectUnion(_reddrawRect,
                                   CGRectMake(_lastTouch.x - horOffset,
                                              _lastTouch.y - verOffset,
                                              _drawImage.size.width,
                                              _drawImage.size.height));
    } else {
        _reddrawRect = CGRectUnion(_reddrawRect, self.currentRect);
    }
    _reddrawRect = CGRectInset(_reddrawRect, -2.0, -2.0);
    [self setNeedsDisplayInRect:_reddrawRect];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);
    
    CGContextSetFillColorWithColor(context, _currentColor.CGColor);
    
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(context);
            break;
        
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        
        case kImageShape: {
            CGFloat horOffset = _drawImage.size.width/2;
            CGFloat verOffset = _drawImage.size.height/2;
            CGPoint drawPoint = CGPointMake(_lastTouch.x - horOffset, _lastTouch.y - verOffset);
            [_drawImage drawAtPoint:drawPoint];
            break;
            
        }

        default:
            break;
    }

}

@end
