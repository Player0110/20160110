//
//  LeftMenuView.m
//  WZYPlayer
//
//  Created by Tagcare on 15/12/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import "LeftMenuView.h"

#import "UIButton+FillColor.h"

@implementation LeftMenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupLeftMenuView:(NSArray *)leftMenuArray {
    self.buttonArray = [NSMutableArray arrayWithCapacity:5];

    _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(60, 50, 80, 80)];
    _iconImage.userInteractionEnabled = YES;
//    [_iconImage setImage:[UIImage imageNamed:@"Head"]];
    _iconImage.backgroundColor = [UIColor colorWithRed:83/255.0 green:222/255.0 blue:201/255.0 alpha:1.0];
    [self addSubview:_iconImage];
    
    
    for (int i = 0; i < leftMenuArray.count; i++) {
        
        NSString * titleStr = leftMenuArray[i];
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:titleStr forState:UIControlStateNormal];
        _button.frame = CGRectMake(0, 180+40*i, 200, 40);
        [_button.titleLabel setTextAlignment:NSTextAlignmentLeft];
        
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        [_button setBackgroundColor:[UIColor colorWithRed:255/255.0 green:104/255.0 blue:124/255.0 alpha:1.0]];
        [_button setBackgroundColor:[UIColor colorWithRed:255/255.0 green:104/255.0 blue:124/255.0 alpha:1.0] forState:UIControlStateHighlighted];
        
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(didClickLeftMenuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonArray addObject:_button];
        [self addSubview:_button];
    }
    
}

- (void)didClickLeftMenuButtonAction:(UIButton *)button {
    
}

@end
