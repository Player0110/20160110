//
//  UserInfo.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/11.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "UserInfo.h"
#define USER_DEFAULT @"userDefault"

@implementation UserInfo

- (NSString *)userIcon {
    if (_userIcon == nil) {
        _userIcon = @"";
    }
    return _userIcon;
}

- (NSString *)userName {
    if (_userName == nil) {
        _userName = @"";
    }
    return _userName;
}

- (NSString *)isLogin {
    if (_isLogin == nil) {
        _isLogin = @"NO";
    }
    return _isLogin;
}

- (instancetype)init {
    NSDictionary * userDefault = [[NSUserDefaults standardUserDefaults] valueForKey:USER_DEFAULT];
    [self setValuesForKeysWithDictionary:userDefault];
    return self;
}

-(void)saveDictionaryUser {
    
    NSLog(@"user %@",[self dictionaryObject]);
    [[NSUserDefaults standardUserDefaults] setObject:[self dictionaryObject] forKey:USER_DEFAULT];

}


-(NSMutableDictionary *)dictionaryObject{
    
    NSMutableDictionary * userDefaultDictionary = [[NSMutableDictionary alloc]init];
    
    [userDefaultDictionary setObject:self.userName forKey:@"userName"];
    [userDefaultDictionary setObject:self.userIcon forKey:@"userIcon"];
    [userDefaultDictionary setObject:self.isLogin forKey:@"isLogin"];

    return userDefaultDictionary;

}

@end
