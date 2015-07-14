//
//  LongNosedSquirrelViewController.m
//  Animation
//
//  Created by caine on 7/10/15.
//  Copyright (c) 2015 com.caine. All rights reserved.
//

#import "LongNosedSquirrelViewController.h"

@interface LongNosedSquirrelViewController ()

//cat style
//---------------
//|   hamster   | visible: NO;
//---------------
//---------------
//|             |
//|    view     |
//|             |
//
//bat style
//---------------
//|   hamster   | visible: YES:
//---------------
//|    view     |
//|             |
//|             |

@property( nonatomic, assign ) BOOL isBatStyle;

@end

@implementation LongNosedSquirrelViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.clipsToBounds = YES;
    
    _isBatStyle = NO;
    _park = [WindPark new];
    [_park setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_park];
}

- (void)viewWillLayoutSubviews{
    
    CGFloat constant;
    
    [self.view addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_park to:self.view type:EdgeLeftRightZero]];
    
    if( _isBatStyle )
        constant = -STATUS_BAR_HEIGHT - SELF_HEIGHT;
    else
        constant = 0;
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_park
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0
                              constant:constant]];
}

@end
