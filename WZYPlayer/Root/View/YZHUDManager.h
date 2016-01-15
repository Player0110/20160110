//
//  YZHUDManager.h
//  SanBanTong
//
//  Created by NateFang on 7/10/15.
//  Copyright (c) 2015 NateFang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface YZHUDManager : NSObject

@property (weak, atomic)UIView* currentHUDView;
@property (nonatomic) BOOL show;


+(YZHUDManager*)sharedYZHUDManager;

- (MBProgressHUD *)showWithStatus:(NSString *)title;
- (void)dismissWithSuccess:(NSString *)title;
- (void)dismissWithSuccess:(NSString *)title delay:(CGFloat)time;
- (void)dismissWithError:(NSString *)title;
- (void)dismissWithError:(NSString *)title delay:(CGFloat)time;
- (void)dismissHUD;
- (void)dismissHUDDelay:(CGFloat)time;
- (void)dismissHUDImmediately;
//只显示文字,提示作用
- (void)showWithHint:(NSString *)title;
- (void)showWithHint:(NSString *)title delay:(CGFloat)time;

@end

typedef NS_ENUM(NSInteger, MMVectorShapeType) {
    MMVectorShapeTypeCheck = 0,
    MMVectorShapeTypeX
};

@interface MMVectorImage : NSObject

+ (UIImage *)vectorImageShapeOfType:(MMVectorShapeType)shapeType
                               size:(CGSize)size
                          fillColor:(UIColor *)fillColor;


@end
