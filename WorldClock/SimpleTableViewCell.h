//
//  SimpleTableViewCell.h
//  WorldClock
//
//  Created by DungLT on 7/3/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewCell : UITableViewCell
@property (nonatomic, weak)IBOutlet UILabel *timeLabel;
@property (nonatomic, weak)IBOutlet UILabel *cityName;
@end
