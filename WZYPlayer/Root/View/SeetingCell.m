//
//  SeetingCell.m
//  WZYPlayer
//
//  Created by Tagcare on 16/5/5.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import "SeetingCell.h"

@implementation SeetingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)cell:(SeetingCell *)cell string:(NSString *)str {
    
    if ([str isEqualToString:@""]) {
        cell.titleLabel.text = @"清除缓存";
        cell.detailLabel.text = [NSString stringWithFormat:@"当前缓存：%.2lfMB",[self.class calculateCache]];
    }else {
        cell.detailLabel.text = str;
    }
    
}


+ (double)calculateCache{
    
    NSString * cachePath  = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];//读取缓存文件大小
    NSString *filePath  = [cachePath stringByAppendingPathComponent:@"ImageCache/"];
    NSDirectoryEnumerator *dirEnumerater = [[NSFileManager defaultManager] enumeratorAtPath:filePath];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    double totalLength = 0.0;
    
    NSString *fileName;
    while (fileName = [dirEnumerater nextObject]) {
        if ([fileName isEqualToString:@"profile.plist"]) {
            continue;
        }
        
        NSString *file=[[NSString alloc] initWithString:[filePath stringByAppendingPathComponent:fileName]];
        if ([fileManager fileExistsAtPath:file]) {
            NSDictionary * attributes = [fileManager attributesOfItemAtPath:file error:nil];
            // file size
            NSNumber *size   = [attributes objectForKey:NSFileSize];
            if ([attributes objectForKey:NSFileSize]){
                totalLength += [size intValue];
            }
        }
        
    }
    
    totalLength = totalLength/1024/1024;
    
    return totalLength;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
