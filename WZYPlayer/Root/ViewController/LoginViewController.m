//
//  LoginViewController.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/5.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "LoginViewController.h"

#import <MediaPlayer/MediaPlayer.h>

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import "DataService.h"

#import "UserInfo.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didClickQQ:(id)sender {
    
    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeQQ
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       associateHandler (user.uid, user, user);
                                       NSLog(@"user.rawData %@",user.rawData);
                                       NSLog(@"user.credential %@",user.credential);
                                       
                                       UserInfo * userInfo = [[UserInfo alloc] init];
                                       userInfo.userName = [user.rawData objectForKey:@"nickname"];
                                       userInfo.userIcon = [user.rawData objectForKey:@"figureurl_qq_2"];
                                       userInfo.isLogin = @"YES";
                                       [userInfo saveDictionaryUser];
                                       
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        NSLog(@"-----------success");
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                    }
                                    
                                }];
}

- (IBAction)didClickWX:(id)sender {
    
    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeWechat
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       associateHandler (user.uid, user, user);
                                       NSLog(@"dd%@",user.rawData);
                                       NSLog(@"dd%@",user.credential);
                                       
                                       UserInfo * userInfo = [[UserInfo alloc] init];
                                       userInfo.userName = [user.rawData objectForKey:@"nickname"];
                                       userInfo.userIcon = [user.rawData objectForKey:@"headimgurl"];
                                       userInfo.isLogin = @"YES";
                                       [userInfo saveDictionaryUser];
                                       
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        NSLog(@"-----------success");
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                    }
                                    
                                }];

    
}


- (IBAction)didClickSina:(id)sender {
    
    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeSinaWeibo
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       associateHandler (user.uid, user, user);
                                       NSLog(@"user%@",user);
                                       NSLog(@"dd%@",user.rawData);
                                       NSLog(@"dd%@",user.credential);
                                       UserInfo * userInfo = [[UserInfo alloc] init];
                                       userInfo.userName = user.nickname;
                                       userInfo.userIcon = user.icon;
                                       userInfo.isLogin = @"YES";
                                       [userInfo saveDictionaryUser];
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        NSLog(@"-----------success");
                                        [self dismissViewControllerAnimated:YES completion:nil];
                                    }
                                    
                                }];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
