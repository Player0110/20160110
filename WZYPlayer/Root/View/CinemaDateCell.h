//
//  CinemaDateCell.h
//  WZYPlayer
//
//  Created by Tagcare on 16/3/24.
//  Copyright © 2016年 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaDateCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (void)cell:(CinemaDateCell *)cell model:(id)model;


@end
