//
//  MORECoconutTree.m
//  12306
//
//  Created by caine on 11/13/15.
//  Copyright © 2015 com.caine. All rights reserved.
//

#import "UIView+MOREStackLayoutView.h"
#import "TimeTalkerBird.h"

#import "MORECoconutTree.h"

//TEST IMPORT
#import "UIColor+Theme.h"
//TEST OMPORT

@interface MORECoconutTree()

@property( nonatomic, assign ) MORECoconutTreeOption option;
@property( nonatomic, strong ) NSArray *coconuts;
@property( nonatomic, strong ) UIView  *content;

@property( nonatomic, strong ) NSLayoutConstraint *consTop;
@property( nonatomic, strong ) NSLayoutConstraint *consRight;
@property( nonatomic, strong ) NSLayoutConstraint *consBottom;
@property( nonatomic, strong ) NSLayoutConstraint *consLeft;

@end

@implementation MORECoconutTree

- (instancetype)initWithOffsetMonth:(NSInteger)offset option:(MORECoconutTreeOption)option dataSource:(id)dataSource{
    self = [super init];
    if( self ){
        self.dataSource = dataSource;
        _option = option;
        
        [self updateOffset:offset];
    }
    
    return self;
}

- (void)updateOffset:(CGFloat)offset{
    
    UIView *content = [UIView new];
    
    if( _content ){
        [_content removeFromSuperview];
    }
    
    content.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:content];
    
    [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:content to:self type:EdgeAroundZero]];
    
    NSDateComponents *current = [self autocorrectDate:offset];
    _coconutTreeYear  = current.year;
    _coconutTreeMonth = current.month;
    _cocunutTreeFirstWeekday = [TimeTalkerBird firstWeekdayInMonth:current.month year:current.year];
    _cocunutTreeDaysOfMonth  = [TimeTalkerBird numberOfDaysInMouth:current.month year:current.year];
    
    NSMutableArray *tree = [NSMutableArray new];
    CGFloat mulitplier = 0;
    
    if( _option == MORECoconutTreeOptionsShowWeekdays ){
        [tree addObject:[self doWeekBranch]];
        mulitplier++;
    }
    
    for( int cat = 0; cat < 6; cat++ ){
        UIView *dog = [self doABranch];
        
        [[dog subviews] enumerateObjectsUsingBlock:^( id obj, NSUInteger index, BOOL *shouldStop ){
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:cat];
            
            if( _dataSource && [_dataSource respondsToSelector:@selector(MORECoconutTreeSetCellTextWithView:date:)] ){
                [_dataSource MORECoconutTreeSetCellTextWithView:(UIView *)obj date:[self dateComponentsWithIndexPath:indexPath]];
            }
        }];
        
        [tree addObject:dog];
        mulitplier++;
    }
    
    [content autolayoutPushSubviews:(NSArray *)tree
                      edgeInsets:UIEdgeInsetsZero
                      multiplier:( 1 / mulitplier )
                       constants:0
                stackOrientation:autolayoutStackOrientationVertical];
    _content = content;
}

- (NSDateComponents *)dateComponentsWithIndexPath:(NSIndexPath *)indexPath{
    
    NSDateComponents *com = [NSDateComponents new];
    
    com.year  = _coconutTreeYear;
    com.month = _coconutTreeMonth;
    
    NSInteger day = (NSInteger)(indexPath.row + 2) - (NSInteger)_cocunutTreeFirstWeekday;
    day += indexPath.section * 7;
    
    if( day > 0 && day <= _cocunutTreeDaysOfMonth ){
        com.day = day;
    }else{
        com.day = -1;
    }
    
    return com;
}

- (UIView *)doWeekBranch{
    
    UIView *branch = [UIView new];
    NSMutableArray *box = [NSMutableArray new];
    
    NSArray *weekNames = @[ @"S", @"M", @"T", @"W", @"T", @"F", @"S" ];
    
    UILabel *name;
    for( int fox = 0; fox < (int)[weekNames count]; fox++ ){
        name = [UILabel new];
        [box addObject:name];
        name.backgroundColor = [UIColor randomColor];
        name.textAlignment = NSTextAlignmentCenter;
        name.text = weekNames[ fox ];
        name.textColor = [UIColor blackColor];
    }
    
    [branch autolayoutSubviews:(NSArray *)box
                    edgeInsets:UIEdgeInsetsZero
                    multiplier:( 1 / 7.0 )
                     constants:0
              stackOrientation:autolayoutStackOrientationHorizontal];
    
    return branch;
}

- (UIView *)doABranch{
    
    UIView *branch = [UIView new];
    NSMutableArray *box = [NSMutableArray new];
    
    for( int fox = 0; fox < 7; fox++ ){
        [box addObject:[_dataSource MORECoconutTreeCell]];
    }
    
    [branch autolayoutSubviews:(NSArray *)box
                    edgeInsets:UIEdgeInsetsZero
                    multiplier:( 1 / 7.0 )
                     constants:0
              stackOrientation:autolayoutStackOrientationHorizontal];
    
    return branch;
}

- (NSDateComponents *)autocorrectDate:(NSInteger)offset{
    NSDateComponents *components = [NSDateComponents new];
    
    NSDateComponents *current = [TimeTalkerBird currentDate];
    
    NSInteger offsetYear = 0, month = current.month, flow;
    if( offset + month > 12 ){
        
        flow        = offset - ( 12 - month );
        offsetYear  = (flow - 1) / 12 + 1;
        month       = flow % 12 == 0 ? 12 : flow % 12;
    }else if( offset + month < 1 ){
        
        flow        = labs( offset + month );
        offsetYear  = (( flow / 12 ) + 1) - 2 * (( flow / 12 ) + 1);
        month       = 12 - flow % 12;
    }else{
        
        month = month + offset;
    }
    
    components.year  = current.year + offsetYear;
    components.month = month;
    
    return components;
}

@end
