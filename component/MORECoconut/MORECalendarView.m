//
//  MORECalendarView.m
//  12306
//
//  Created by caine on 11/14/15.
//  Copyright © 2015 com.caine. All rights reserved.
//
#import "UIColor+Theme.h"

#import "NSLayoutConstraint+SpectacledBearEdgeConstraint.h"
#import "UIView+MOREStackLayoutView.h"

#import "MORECalendarView.h"

@interface MORECalendarView()<MORECoconutTreeDelegate>

@property( nonatomic, strong ) UIImageView *themeImage;

@property( nonatomic, strong ) UIView  *content;
@property( nonatomic, strong ) UILabel *bear;

@property( nonatomic, assign ) CGFloat cellDiameter;

@end

@implementation MORECalendarView

- (UIView *)MORECoconutTreeCell{
    
    if( !_cellDiameter ){
        CGFloat width = [UIScreen mainScreen].bounds.size.width / 7;
        CGFloat height = ([UIScreen mainScreen].bounds.size.height * ( 1 - 0.618 )) / 6;
        _cellDiameter = width > height ? height - 6 : width - 6;
    }
    
    _bear = [UILabel new];
    _bear.textAlignment = NSTextAlignmentCenter;
    _bear.font = [UIFont fontWithName:@"Roboto" size:21];
    
    _content = [UIView new];
    
    _bear.translatesAutoresizingMaskIntoConstraints = NO;
    [_content addSubview:_bear];

    [_content addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_bear to:_content type:EdgeCenterXY]];
    [_bear addConstraints:[NSLayoutConstraint SpactecledBearFixed:_bear type:SpactecledBearFixedEqual constant:_cellDiameter]];
    
    return _content;
}

- (void)MORECoconutTreeSetCellTextWithView:(UIView *)view date:(NSDateComponents *)date{
    UILabel *label = (UILabel *)[view subviews][0];
    
    if( date.day < 0 ) return;
    if( date.day == 7 ){
        label.textColor = [UIColor randomColor];
        label.font = [UIFont fontWithName:@"Roboto-bold" size:27];
    }else{
        label.textColor = [UIColor colorWithWhite:77 / 255.0 alpha:1];
    }
    
    label.text = [NSString stringWithFormat:@"%ld", date.day];
}

- (instancetype)initWithMonthOffset:(NSInteger)offset{
    self = [super init];
    if( self ){
        
        _coconutTree = [[MORECoconutTree alloc] initWithOffsetMonth:offset option:MORECoconutTreeOptionNone dataSource:self];
        _coconutTree.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_coconutTree];
        
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_coconutTree to:self type:EdgeLeftRightZero constant:6]];
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_coconutTree to:self type:EdgeBottomZero]];
        [self addConstraints:[NSLayoutConstraint spactecledTwoBearFixed:_coconutTree anotherBear:self type:SpactecledBearFixedHeight multiplier:( 1 - 0.618 ) constant:0]];
        
        _themeImage = [UIImageView new];
        _themeImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_themeImage];
        
        _themeImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"M%ld.jpg", _coconutTree.coconutTreeMonth]];
        
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_themeImage to:self type:EdgeTopLeftRightZero]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_themeImage
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_coconutTree
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0]];
        UIView *jerk = [self jerk];
        jerk.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:jerk];
        
        jerk.backgroundColor = [UIColor colorWithWhite:0 alpha:0.57];
        
        [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:jerk to:_themeImage type:EdgeBottomLeftRightZero]];
        [self addConstraints:[NSLayoutConstraint SpactecledBearFixed:jerk type:SpactecledBearFixedHeight constant:44]];
    }
    return self;
}

- (void)updateMonthOffset:(NSInteger)offset{
    [_coconutTree updateOffset:offset];
    _themeImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"M%ld.jpg", _coconutTree.coconutTreeMonth]];
}

- (UIView *)jerk{
    
    UIScrollView *jerk = [UIScrollView new];
    jerk.scrollEnabled = NO;
    
    NSMutableArray *fuck = [NSMutableArray new];
    NSArray *dick = @[ @"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat" ];
    
    [dick enumerateObjectsUsingBlock:^( id obj, NSUInteger index, BOOL *shouldStop ){

        UILabel *cock = [UILabel new];
        cock.textAlignment = NSTextAlignmentCenter;
        cock.textColor = [UIColor whiteColor];
        cock.font = [UIFont fontWithName:@"Roboto" size:17];
        cock.text = (NSString *)obj;
        [fuck addObject:cock];
    }];
    
    jerk.contentInset = UIEdgeInsetsMake(0, 6, 0, 6);
    [jerk autolayoutSubviews:(NSArray *)fuck
                      edgeInsets:UIEdgeInsetsZero
                      multiplier:( 1 / 7.0 )
                       constants:-( 12 / 7.0 )
                stackOrientation:autolayoutStackOrientationHorizontal];
    
    return jerk;
}

@end
