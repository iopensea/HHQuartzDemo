//
//  HHQuartzFunView.h
//  HHQuartzDemo
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHConstants.h"

@interface HHQuartzFunView : UIView

@property (nonatomic, assign) CGPoint firstTouch;
@property (nonatomic, assign) CGPoint lastTouch;
@property (nonatomic, strong) UIColor *currentColor;
@property (nonatomic, assign) ShapeType shapeType;
@property (nonatomic, strong) UIImage *drawImage;
@property (nonatomic, assign) BOOL useRandomColor;

@property (readonly) CGRect currentRect;
@property CGRect reddrawRect;

@end
