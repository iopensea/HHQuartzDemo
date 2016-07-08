//
//  HHViewController.h
//  HHQuartzDemo
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface HHViewController : ViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;


- (IBAction)changeColor:(id)sender;

- (IBAction)changeShape:(id)sender;

@end
