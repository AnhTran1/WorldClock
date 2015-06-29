//
//  AlarmTableViewController.h
//  WorldClock
//
//  Created by DungLT on 6/25/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmObject.h"
#import "AddAlarmTableViewController.h"

@interface AlarmTableViewController : UITableViewController
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
