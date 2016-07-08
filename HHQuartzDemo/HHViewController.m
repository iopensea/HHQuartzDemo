//
//  HHViewController.m
//  HHQuartzDemo
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HHViewController.h"
#import "HHConstants.h"
#import "HHQuartzFunView.h"

@interface HHViewController ()

@end

@implementation HHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)changeColor:(id)sender {
    UISegmentedControl *control = sender;
    ColorTabIndex index = (ColorTabIndex)[control selectedSegmentIndex];
    
    HHQuartzFunView *funView = (HHQuartzFunView *)self.view;
    
    switch (index) {
        case kRedColorTab:
            funView.currentColor = [UIColor redColor];
            funView.useRandomColor = NO;
            break;

        case kBlueColorTab:
            funView.currentColor = [UIColor blueColor];
            funView.useRandomColor = NO;
            break;
        
        case kYellowColorTab:
            funView.currentColor = [UIColor yellowColor];
            funView.useRandomColor = NO;
            break;
        
        case kGreenColorTab:
            funView.currentColor = [UIColor greenColor];
            funView.useRandomColor = NO;
            break;
        
        case kRandomColorTab:
            funView.useRandomColor = YES;
            break;

        default:
            break;
    }
}

- (void)changeShape:(id)sender {
    UISegmentedControl *control = sender;
    [(HHQuartzFunView *)self.view setShapeType:(ShapeType)[control selectedSegmentIndex]];
    
    if ((ColorTabIndex)[control selectedSegmentIndex] == kImageShape) {
        _colorControl.hidden = YES;
    } else {
        _colorControl.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
