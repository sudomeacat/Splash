//
//  Ring : NSObject.m
//  Splash
//
//  Created by Krish Kalai on 4/29/18.
//  Copyright © 2018 Krish Kalai. All rights reserved.
//

#import <math.h>
#import "Ring.h"

@implementation Ring

const double MIN_RADIUS = 5.;
const double MAX_RADIUS = 30.;

- (instancetype)initWithCount:(int)count Ring:(int)ring Offset:(double)offset Center:(NSPoint)center {
    self = [super init];
    if (self) {
        self.transform_amplifier = ring;
        self.circles = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++) {
            double angle = i * (2 * M_PI) / count + offset;
            [self.circles addObject:[[Circle alloc] initWithOrigin:NSMakePoint(ring * 50 * sin(angle) + center.x,
                                                                               ring * 50 * cos(angle) + center.y)
                                                             Angle:angle]];
        }
    }
    return self;
}

- (void)transform:(double)t {
    for (Circle* c in self.circles) {
        [c transformWithMagnitude: self.transform_amplifier*sin(0.25*self.transform_amplifier+t)];
        c.radius = (MAX_RADIUS-MIN_RADIUS)/2 * cos(t+self.transform_amplifier) + (MAX_RADIUS+MIN_RADIUS)/2;
    }
}

- (void)draw {
    for (Circle* c in self.circles) {
        [c draw];
    }
}

@end
