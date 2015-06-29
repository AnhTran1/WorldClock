//
//  AddAlarmTableViewController.h
//  WorldClock
//
//  Created by DungLT on 6/26/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmObject.h"

@interface AddAlarmTableViewController : UIViewController
@property AlarmObject *alarmObject;
@property NSMutableArray *listOfAlarm;
@property (nonatomic, assign) NSInteger indexOfAlarmToEdit;
@end
