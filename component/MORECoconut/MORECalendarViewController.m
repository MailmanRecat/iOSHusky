//
//  MORECalendarViewController.m
//  MOREAmazing
//
//  Created by caine on 11/14/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import "UIView+MOREStackLayoutView.h"
#import "WindPark.h"
#import "MORETitleView.h"
#import "TimeTalkerBird.h"
#import "MORECalendarView.h"
#import "UIColor+Theme.h"
#import "UIFont+MaterialDesignIcons.h"

#import "MORECalendarViewController.h"

@interface MORECalendarViewController ()<UIScrollViewDelegate>

@property( nonatomic, strong ) WindPark *park;
@property( nonatomic, strong ) NSArray  *parkColor;

@property( nonatomic, assign ) NSInteger cock;
@property( nonatomic, assign ) BOOL autocorrect;
@property( nonatomic, strong ) UIScrollView     *bear;
@property( nonatomic, strong ) MORECalendarView *fuck;
@property( nonatomic, strong ) MORECalendarView *jerk;
@property( nonatomic, strong ) MORECalendarView *dick;

@end

@implementation MORECalendarViewController

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pointX = scrollView.contentOffset.x;
    CGFloat swidth = scrollView.frame.size.width;
    
    if( pointX == 0 && _autocorrect ){
        _cock--;
        [self updateBear];
    }else if( pointX == swidth * 2 && _autocorrect ){
        _cock++;
        [self updateBear];
    }
    
}

- (void)updateBear{
    
    [_fuck updateMonthOffset:_cock - 1];
    [_jerk updateMonthOffset:_cock];
    [_dick updateMonthOffset:_cock + 1];
    _bear.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    
//    [UIView animateWithDuration:0.25f
//                     animations:^{
//                         _park.backgroundColor = _parkColor[ _jerk.coconutTree.coconutTreeMonth - 1 ];
//                     }];
    
    [self updateNameplate];
}

- (void)updateNameplate{
    NSArray *cock = @[ @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec" ];
    NSArray *dick = @[ @"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat" ];
    NSString *text;
    if( _cock == 0 ){
        NSDateComponents *date = [TimeTalkerBird currentDate];
        text = [NSString stringWithFormat:@"%@, %@ %ld", dick[date.weekday - 1], cock[_jerk.coconutTree.coconutTreeMonth - 1], date.day ];
    }else{
        text = [NSString stringWithFormat:@"%@ %ld", cock[_jerk.coconutTree.coconutTreeMonth - 1], _jerk.coconutTree.coconutTreeYear];
    }
    _park.nameplate.text = text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    if( !_cock ) _cock = 0;
    if( !_autocorrect ) _autocorrect = NO;
    if( !_parkColor ){
        _parkColor = @[
                       [UIColor colorWithRed:202 / 255.0 green:217 / 255.0 blue:241 / 255.0 alpha:1],
                       [UIColor colorWithRed:180 / 255.0 green:222 / 255.0 blue:223 / 255.0 alpha:1],
                       [UIColor colorWithRed:200 / 255.0 green:225 / 255.0 blue:168 / 255.0 alpha:1],
                       [UIColor colorWithRed:251 / 255.0 green:231 / 255.0 blue:179 / 255.0 alpha:1],
                       [UIColor colorWithRed:136 / 255.0 green:204 / 255.0 blue:172 / 255.0 alpha:1],
                       [UIColor colorWithRed:250 / 255.0 green:217 / 255.0 blue:129 / 255.0 alpha:1],
                       [UIColor colorWithRed:173 / 255.0 green:212 / 255.0 blue:128 / 255.0 alpha:1],
                       [UIColor colorWithRed:252 / 255.0 green:232 / 255.0 blue:180 / 255.0 alpha:1],
                       [UIColor colorWithRed:253 / 255.0 green:248 / 255.0 blue:199 / 255.0 alpha:1],
                       [UIColor colorWithRed:250 / 255.0 green:217 / 255.0 blue:219 / 255.0 alpha:1],
                       [UIColor colorWithRed:195 / 255.0 green:193 / 255.0 blue:195 / 255.0 alpha:1],
                       [UIColor colorWithRed:232 / 255.0 green:233 / 255.0 blue:246 / 255.0 alpha:1]
                       ];
    }
    
    [self loadTopBear];
    [self loadBear];
}

- (void)viewDidAppear:(BOOL)animated{
    
    _autocorrect = YES;
    _bear.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    [UIView animateWithDuration:0.77f
                     animations:^{
                         _bear.alpha = 1;
                     }];
}

- (void)loadTopBear{
    _park = [WindPark new];
    _park.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_park];
    
    _park.cliff.enabled = _park.mountain.enabled = NO;
    
//    _park.backgroundColor = [UIColor colorWithWhite:0 alpha:0.57];
    _park.backgroundColor = [UIColor whiteColor];
    
    [self.view addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_park to:self.view type:EdgeTopLeftRightZero]];
    
    [_park nameplate:@"2015"];
    _park.nameplate.font = [UIFont fontWithName:@"Roboto" size:21];
//    _park.nameplate.textColor = [UIColor whiteColor];
    _park.nameplate.textColor = [UIColor colorWithWhite:33 / 255.0 alpha:1];
    
    [_park sunset];
    
    _park.herb.titleLabel.font = [UIFont MaterialDesignIcons];
    [_park.herb setTitle:[UIFont mdiClose] forState:UIControlStateNormal];
    [_park.herb setTitleColor:_park.nameplate.textColor forState:UIControlStateNormal];
//    [_park.herb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_park.herb addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadBear{
    
    UIScrollView *bear = [UIScrollView new];
    bear.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view insertSubview:bear belowSubview:_park];
    
    bear.showsHorizontalScrollIndicator = NO;
    bear.showsVerticalScrollIndicator = NO;
    bear.pagingEnabled = YES;
    bear.delegate = self;
    bear.alpha = 0;
    
    [self.view addConstraints:[NSLayoutConstraint SpactecledBearEdeg:bear to:self.view type:EdgeAroundZero]];
    
    _bear = bear;
    _fuck = [[MORECalendarView alloc] initWithMonthOffset:_cock - 1];
    _jerk = [[MORECalendarView alloc] initWithMonthOffset:_cock];
    _dick = [[MORECalendarView alloc] initWithMonthOffset:_cock + 1];
    
    _fuck.translatesAutoresizingMaskIntoConstraints =
    _jerk.translatesAutoresizingMaskIntoConstraints =
    _dick.translatesAutoresizingMaskIntoConstraints = NO;
    
    [bear autolayoutSubviews:@[ _fuck, _jerk, _dick ]
                  edgeInsets:UIEdgeInsetsZero
                  multiplier:1.0
                   constants:0
            stackOrientation:autolayoutStackOrientationHorizontal];
    
    [self updateNameplate];
}

- (void)dismissSelf{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
