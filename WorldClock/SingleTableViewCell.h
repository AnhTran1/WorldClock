//
//  SingleTableViewCell.h
//  WorldClock
//
//  Created by DungLT on 7/3/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
- (void) hiddenButtons;
- (void) showButtons;

@end
