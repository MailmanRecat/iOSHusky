//
//  FerryBoat.m
//  12306
//
//  Created by caine on 7/13/15.
//  Copyright (c) 2015 com.caine. All rights reserved.
//

#define STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define SELF_HEIGHT 52
#define LABEL_HEIGHT 32

#import "FerryBoat.h"

typedef NS_ENUM(NSUInteger, ReRectType){
    ReRectTypeOriginX = 0,
    ReRectTypeOriginY,
    ReRectTypeSizeWidth,
    ReRectTypeSizeHeight
};

@interface FerryBoat()<UIScrollViewDelegate>

@property( nonatomic, strong ) UIView       *ferry;
@property( nonatomic, strong ) UIScrollView *seal;

@property( nonatomic, assign ) NSInteger     currentOffset;
@property( nonatomic, strong ) coconut      *leftCoconut;
@property( nonatomic, strong ) coconut      *rightCoconut;

@end

@implementation FerryBoat

- (UIView *)reRectWithView:(UIView *)view reRectType:(ReRectType)type constant:(CGFloat)constant{
    
    CGRect coyote = view.frame;
    switch (type) {
        case ReRectTypeOriginX:
            
            coyote.origin.x = constant;
            break;
        case ReRectTypeOriginY:
            
            coyote.origin.y = constant;
            break;
        case ReRectTypeSizeWidth:
            
            coyote.size.width = constant;
            break;
        case ReRectTypeSizeHeight:
            
            coyote.size.height = constant;
            break;
        default:
            break;
    }
    
    view.frame = coyote;
    return view;
}

- (CGRect)reRectWithRect:(CGRect)rect Type:(ReRectType)type constants:(CGFloat)constant{
    
    switch (type) {
        case ReRectTypeOriginX:
            
            rect.origin.x = constant;
            break;
        case ReRectTypeOriginY:
            
            rect.origin.y = constant;
            break;
        case ReRectTypeSizeWidth:
            
            rect.size.width = constant;
            break;
        case ReRectTypeSizeHeight:
            
            rect.size.height = constant;
            break;
        default:
            break;
    }
    
    return rect;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if( scrollView.contentOffset.x == 0 ){

        _currentOffset--;
        [self updateSealSubviews];
        
    }else if( scrollView.contentOffset.x == scrollView.frame.size.width * 2 ){
        
        _currentOffset++;
        [self updateSealSubviews];
        
    }
}

- (void)updateSealSubviews{
    
    UIView *oldCenterView = [_seal viewWithTag:1000];
    oldCenterView.tag = 2000;
    [oldCenterView removeFromSuperview];
    
    coconut *centerView = [[coconut alloc] initWithFrame:oldCenterView.frame offsetMonth:_currentOffset];
    centerView.tag = 1000;
    [_seal addSubview:centerView];
    
    [self updateLabelWithYear:[centerView coconutYear] month:[centerView coconutMonth]];
    _seal.contentOffset = CGPointMake(_seal.frame.size.width, 0);
    
    UIView *oldLeftView = [_seal viewWithTag:999];
    oldLeftView.tag = 2000;
    [oldLeftView removeFromSuperview];
    
    coconut *leftView = [[coconut alloc] initWithFrame:oldLeftView.frame offsetMonth:_currentOffset - 1];
    leftView.tag = 999;
    [_seal addSubview:leftView];
    
    UIView *oldRightView = [_seal viewWithTag:1001];
    oldRightView.tag = 2000;
    [oldRightView removeFromSuperview];
    
    coconut *rightView = [[coconut alloc] initWithFrame:oldRightView.frame offsetMonth:_currentOffset + 1];
    rightView.tag = 1001;
    [_seal addSubview:rightView];
}

- (void)updateLabelWithYear:(NSUInteger)year month:(NSUInteger)month{
    
    _dateLabel.text = [NSString stringWithFormat:@"%ld年 %ld月", year, month];
}

- (void)sunrise{

    self.layer.shadowOpacity = 0.0f;
}

- (void)sunset{
    
    self.layer.shadowOpacity = 0.3f;
}

- (instancetype)initWithFrame:(CGRect)frame{

    _coconut = [[coconut alloc] initWithFrame:CGRectMake(frame.size.width, 0, frame.size.width, 0) offsetMonth:0];
    _currentOffset = 0;
    
    frame.size.height = SELF_HEIGHT + STATUS_BAR_HEIGHT + LABEL_HEIGHT + _coconut.frame.size.height;
    self = [super initWithFrame:frame];
    
    if( !self ) return self;
    
    _ferry = [UIView new];
    [_ferry setTranslatesAutoresizingMaskIntoConstraints:NO];
        
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.0f;
    self.layer.shadowOffset = CGSizeMake(1, 4);
    self.layer.shadowRadius = 3.0f;
        
    UIColor *huskyFurColor = [UIColor whiteColor];
    _river = [HuskyButton new];
    [_river setTranslatesAutoresizingMaskIntoConstraints:NO];
    _river.backgroundColor = huskyFurColor;
        
    _leftSide = [HuskyButton new];
    [_leftSide setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_leftSide setBackgroundColor:huskyFurColor];
        
    _rightSide = [HuskyButton new];
    [_rightSide setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_rightSide setBackgroundColor:huskyFurColor];
    
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, STATUS_BAR_HEIGHT + SELF_HEIGHT, frame.size.width - 64, LABEL_HEIGHT)];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.font  = [UIFont boldSystemFontOfSize:17];
    NSUInteger year  = [_coconut coconutYear];
    NSUInteger month = [_coconut coconutMonth];
    [self updateLabelWithYear:year month:month];
    
    _seal = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT + SELF_HEIGHT + LABEL_HEIGHT, self.frame.size.width, _coconut.frame.size.height)];
    _seal.contentSize = CGSizeMake(self.frame.size.width * 3, _seal.frame.size.height);
    _seal.contentOffset = CGPointMake(frame.size.width, 0);
    _seal.showsHorizontalScrollIndicator = NO;
    _seal.showsVerticalScrollIndicator   = NO;
    _seal.delegate = self;
    _seal.pagingEnabled = YES;
    [_seal addSubview:_coconut];
    
    _coconut.tag = 1000;
    CGRect elephant = _coconut.frame;
    elephant.origin.x = 0;
    _leftCoconut = [[coconut alloc] initWithFrame:elephant offsetMonth:-1];
    _leftCoconut.tag = 999;
    elephant.origin.x = frame.size.width * 2;
    _rightCoconut = [[coconut alloc] initWithFrame:elephant offsetMonth:1];
    _rightCoconut.tag = 1001;
    
    [_seal addSubview:_leftCoconut];
    [_seal addSubview:_rightCoconut];
    
    [self addSubview:_ferry];
    [_ferry addSubview:_river];
    [_ferry addSubview:_leftSide];
    [_ferry addSubview:_rightSide];
    
    [self addSubview:_dateLabel];
    [self addSubview:_seal];
    
    return self;
}

- (void)layoutSubviews{
    
    [_ferry addConstraints:[NSLayoutConstraint SpactecledBearFixed:_ferry type:SpactecledBearFixedHeight constant:SELF_HEIGHT]];
    [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_ferry to:self type:EdgeLeftRightZero]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_ferry
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0f
                                                      constant:STATUS_BAR_HEIGHT]];
    
    [_river addConstraints:[NSLayoutConstraint SpactecledBearFixed:_river type:SpactecledBearFixedEqual constant:SELF_HEIGHT]];
    [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_river to:_ferry type:EdgeCenterXY]];
    
    [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_leftSide to:_ferry type:EdgeTopLeftBottomZero]];
    [_ferry addConstraint:[NSLayoutConstraint constraintWithItem:_leftSide
                                                       attribute:NSLayoutAttributeRight
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:_river
                                                       attribute:NSLayoutAttributeLeft
                                                      multiplier:1.0f
                                                        constant:0]];
    
    [self addConstraints:[NSLayoutConstraint SpactecledBearEdeg:_rightSide to:_ferry type:EdgeTopRightBottomZero]];
    [_ferry addConstraint:[NSLayoutConstraint constraintWithItem:_rightSide
                                                       attribute:NSLayoutAttributeLeft
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:_river
                                                       attribute:NSLayoutAttributeRight
                                                      multiplier:1.0f
                                                        constant:0]];

}

@end
