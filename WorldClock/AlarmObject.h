//
//  AlarmObject.h
//  WorldClock
//
//  Created by DungLT on 6/26/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmObject : NSObject<NSCoding>

@property (nonatomic,strong) NSString *label;
@property (nonatomic,strong) NSDate *timeToSetOff;

@end
