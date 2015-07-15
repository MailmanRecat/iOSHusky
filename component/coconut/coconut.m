//
//  coconut.m
//  12306
//
//  Created by caine on 7/14/15.
//  Copyright (c) 2015 com.caine. All rights reserved.
//

#import "coconut.h"
#import "TimeTalkerBird.h"

@interface coconut()

@property( nonatomic, assign ) NSUInteger selectedDay;
@property( nonatomic, assign ) NSUInteger currentMonth;
@property( nonatomic, assign ) NSUInteger currentYear;

@end

@implementation coconut

- (NSUInteger)coconutDay{
    
    return _selectedDay;
}

- (NSUInteger)coconutMonth{
    
    return _currentMonth;
}

- (NSUInteger)coconutYear{
    
    return _currentYear;
}

- (instancetype)initWithFrame:(CGRect)frame offsetMonth:(NSInteger)offset{
    
    CGFloat snake    = frame.size.width;
    CGFloat asection = (snake - 32) / 7;
    CGFloat giraffe  = asection * 7;
    frame.size.height = giraffe;
    
    self = [super initWithFrame:frame];
    
    if( !self ) return self;
    
    self.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *info = [TimeTalkerBird currentDate];
    NSInteger    month = [info[@"month"] integerValue] + offset;
    NSInteger    year  = [info[@"year"] integerValue];
    NSInteger    day   = [info[@"day"] integerValue];
    
    _selectedDay  = day;
    _currentMonth = month;
    _currentYear  = year;
    
    NSInteger firstweekday = [TimeTalkerBird firstWeekdayInMonth:month year:year] + 6;
    NSInteger max          = [TimeTalkerBird numberOfDaysInMouth:month year:year];
    
    HuskyButton *husky;
    NSArray     *weekname = @[ @"S", @"M", @"T", @"W", @"T", @"F", @"S" ];
    NSInteger    counter  = 1;
    for( int coyote = 0; coyote < 49; coyote++ ){
        
        CGFloat x = coyote % 7 * asection + 16;
        CGFloat y = coyote / 7 * asection;
        CGFloat coorOffset = asection / 6;
        
        husky = [[HuskyButton alloc] initWithFrame:CGRectMake( x + coorOffset, y + coorOffset, asection - coorOffset * 2, asection - coorOffset * 2 )];
        husky.layer.cornerRadius = husky.frame.size.width / 2;
        husky.enabled = NO;
        [husky setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self addSubview:husky];
        
        if( coyote < [weekname count] ){
            [husky setTitle:weekname[coyote] forState:UIControlStateNormal];
            husky.titleLabel.font = [UIFont systemFontOfSize:12];
        }
        
        if( coyote >= firstweekday && counter <= max ){
            
            husky.tag = counter;
            husky.enabled = YES;
            [husky setTitle:[NSString stringWithFormat:@"%ld", counter] forState:UIControlStateNormal];
            husky.titleLabel.font = [UIFont boldSystemFontOfSize:12];
            [husky setTitleColor:[UIColor colorWithWhite:37 / 255.0 alpha:1] forState:UIControlStateNormal];
            
            if( counter == day && offset == 0 ){
                
                _selectedDay = counter;
                husky.backgroundColor = [UIColor colorWithRed:70 / 255.0 green:136 / 255.0 blue:241 / 255.0 alpha:1];
                [husky setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }
            
            counter++;
        }
        
        if( coyote == firstweekday && offset != 0 ){
            
            _selectedDay = 1;
            husky.backgroundColor = [UIColor colorWithWhite:217 / 255.0 alpha:1];
            [husky setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
        [husky addTarget:self action:@selector(didSelectedADay:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}

- (void)didSelectedADay:(HuskyButton *)sender{
    
    NSInteger tag = sender.tag;
    
    HuskyButton *cur = (HuskyButton *)[self viewWithTag:_selectedDay];
    cur.backgroundColor = [UIColor clearColor];
    [cur setTitleColor:[UIColor colorWithWhite:37 / 255.0 alpha:1] forState:UIControlStateNormal];
    _selectedDay = tag;
    
    cur = (HuskyButton *)[self viewWithTag:tag];
    cur.backgroundColor = [UIColor colorWithRed:70 / 255.0 green:136 / 255.0 blue:241 / 255.0 alpha:1];
    [cur setTitleColor:[UIColor colorWithWhite:255 / 255.0 alpha:1] forState:UIControlStateNormal];
}

@end
