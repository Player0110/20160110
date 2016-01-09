//
//  LeftMenuView.h
//  WZYPlayer
//
//  Created by Tagcare on 15/12/7.
//  Copyright © 2015年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLSlideMenu.h"

@interface LeftMenuView : LLSlideMenu

@property (nonatomic, strong, readonly)UIImageView * iconImage;
@property (nonatomic, strong, readonly)UIButton * button;

@property (nonatomic, strong)NSMutableArray * buttonArray;

- (void)setupLeftMenuView:(NSArray *)leftMenuArray;


@end
