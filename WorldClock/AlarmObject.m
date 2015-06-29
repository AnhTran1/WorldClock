//
//  AlarmObject.m
//  WorldClock
//
//  Created by DungLT on 6/26/15.
//  Copyright (c) 2015 DungLT. All rights reserved.
//

#import "AlarmObject.h"

@implementation AlarmObject

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.label forKey:@"label"];
    [encoder encodeObject:self.timeToSetOff forKey:@"timeToSetOff"];
}

- (id)initWithCoder:(NSCoder *)decoder{
    self.label = [decoder decodeObjectForKey:@"label"];
    self.timeToSetOff = [decoder decodeObjectForKey:@"timeToSetOff"];
    return self;
}

@end
