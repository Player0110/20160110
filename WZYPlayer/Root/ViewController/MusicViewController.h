//
//  MusicViewController.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/2.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootModel.h"

@interface MusicViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *musicWebView;
@property(strong, nonatomic) RootModel *rootModel;

@end
