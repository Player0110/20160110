//
//  YZHUDManager.m
//  SanBanTong
//
//  Created by NateFang on 7/10/15.
//  Copyright (c) 2015 NateFang. All rights reserved.
//

#import "YZHUDManager.h"

@implementation YZHUDManager {
    UIWindow *window;
    MBProgressHUD *hud;
}

+(YZHUDManager*)sharedYZHUDManager
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        
    });
    return _sharedObject;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (MBProgressHUD *)showWithStatus:(NSString *)title {
    if (window != nil || hud != nil) {
        [self dismissHUDImmediately];
    }
    window = [[[UIApplication sharedApplication] windows] lastObject];
    hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.labelText = title;
    
    UIView *animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_image"]];
    [animationView addSubview:imageView];
    imageView.tag = 1;
    hud.customView = animationView;
    hud.mode = MBProgressHUDModeCustomView;
    
    [self startAnimation:imageView];
    
    return hud;
}

-(void)setNewTitle:(NSString*)title {
    if (hud == nil) {
        [self showWithStatus:title];
    }
    hud.labelText = title;
}

- (void)startAnimation:(UIImageView *)imageView {
    
    static float angle = 0.0;
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    [UIView animateWithDuration:0.0005 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.transform = endAngle;
    } completion:^(BOOL finished) {
        angle += 5;
        if (imageView != nil && imageView.tag == 1) {
            [self startAnimation:imageView];
        }
    }];
}

-(void)dismissWithSuccess:(NSString *)title delay:(CGFloat)time {
    if (hud == nil) {
        UIImage* image = [MMVectorImage vectorImageShapeOfType:MMVectorShapeTypeCheck size:CGSizeMake(64, 64) fillColor:[UIColor whiteColor]];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.labelText = title;
        hud.mode = MBProgressHUDModeCustomView;
        
        [self dismissHUDDelay:time];
    }
    
}

- (void)dismissWithSuccess:(NSString *)title {
    [self dismissWithSuccess:title delay:0.8f];
}

- (void)dismissWithError:(NSString *)title delay:(CGFloat)time {
    if (hud != nil) {
        UIImage* image = [MMVectorImage vectorImageShapeOfType:MMVectorShapeTypeX size:CGSizeMake(64, 64) fillColor:[UIColor whiteColor]];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.labelText = title;
        hud.mode = MBProgressHUDModeCustomView;
        
        [self dismissHUDDelay:time];
    }
}

- (void)dismissWithError:(NSString *)title {
    [self dismissWithError:title delay:1.5];
}

- (void)dismissHUD {
    [self dismissHUDDelay:0.8f];
}

-(void)dismissHUDDelay:(CGFloat)time {
    [self performSelector:@selector(dismissHUDImmediately) withObject:nil afterDelay:time];
}

- (void)dismissHUDImmediately {
    if (hud != nil) {
        hud.customView.tag = 0;
    }
    if (window != nil) {
        [MBProgressHUD hideHUDForView:window animated:YES];
    }
    window = nil;
    hud = nil;
}

//只显示文字
- (void)showWithHint:(NSString *)title {
    [self showWithHint:title delay:1.5];
}

-(void)showWithHint:(NSString *)title delay:(CGFloat)time
{
    if (window != nil) {
        [MBProgressHUD hideHUDForView:window animated:NO];
    }
    window = [[[UIApplication sharedApplication] windows] lastObject];
    hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.margin = 10.f;
    //    hud.yOffset = 90.f; //设置y值
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:time];
}



@end

@implementation MMVectorImage

+ (UIImage *)vectorImageShapeOfType:(MMVectorShapeType)shapeType size:(CGSize)size fillColor:(UIColor *)fillColor {
    CGFloat scale = [[UIScreen mainScreen] scale];
    
    CGSize imageSize = size;
    if (size.width != size.height) {
        CGFloat dimension = MAX(size.width, size.height);
        imageSize = CGSizeMake(dimension, dimension);
    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, scale);
    
    [self drawShapeOfType:shapeType size:imageSize fillColor:fillColor];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (void)drawShapeOfType:(MMVectorShapeType)shapeType size:(CGSize)size fillColor:(UIColor *)fillColor {
    CGSize vectorSize = CGSizeMake(512.f, 512.f);//vector strings based on 512x512 size
    NSString *pointsString = [self vectorPointStringForShapeType:shapeType];
    NSArray *pointsStringArray = [pointsString componentsSeparatedByString:@" "];
    UIBezierPath *vectorPath = [UIBezierPath bezierPath];
    for (NSString *point in pointsStringArray) {
        NSArray *individualPoint = [point componentsSeparatedByString:@","];
        CGFloat x = [individualPoint[0] floatValue]/vectorSize.width;
        CGFloat y = [individualPoint[1] floatValue]/vectorSize.height;
        CGPoint newPoint = CGPointMake(x*size.width, y*size.height);
        if ([vectorPath isEmpty]) {
            [vectorPath moveToPoint:newPoint];
        }
        else {
            [vectorPath addLineToPoint:newPoint];
        }
    }
    
    if ([vectorPath isEmpty] == NO) {
        [vectorPath closePath];
        
        [fillColor setFill];
        
        [vectorPath fill];
    }
}

+ (NSString *)checkMarkVectorString {
    return @"434.442,58.997 195.559,297.881 77.554,179.88 0,257.438 195.559,453.003 512,136.551";
}

+ (NSString *)xMarkVectorString {
    return @"512,120.859 391.141,0 255.997,135.146 120.855,0 0,120.859 135.132,256.006 0,391.146 120.855,512 255.997,376.872 391.141,512 512,391.146 376.862,256.006";
}

+ (NSString *)vectorPointStringForShapeType:(MMVectorShapeType)shapeType {
    switch (shapeType) {
        case MMVectorShapeTypeCheck:
            return [self checkMarkVectorString];
        case MMVectorShapeTypeX:
            return [self xMarkVectorString];
    }
}

@end
